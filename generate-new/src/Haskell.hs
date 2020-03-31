module Haskell
  ( Type(..)
  , Name
  , renderType
  , renderTypeSource
  , renderTypeHighPrec
  , renderTypeHighPrecSource
  , allTypeNames
  , pattern (:@)
  , typeName
  , mkVar
  , (~>)
  , arrowUniqueVars
  , module Haskell.Name
  )
where

import           Relude                  hiding ( Type
                                                , group
                                                , State
                                                , Reader
                                                , ask
                                                , words
                                                , unwords
                                                )
import           Language.Haskell.TH
import           Data.Text.Prettyprint.Doc
import           Data.Generics.Uniplate.Data
import           Polysemy
import           Polysemy.Reader
import           Data.Char                      ( isLower )
import qualified Data.List.Extra               as List
import qualified Data.Text                     as T
import qualified Data.Vector                   as V
import           Prelude                        ( head
                                                , words
                                                , unwords
                                                )

import           Render.Element
import           Haskell.Name

typeName :: HName -> Name
typeName = mkName . T.unpack . unName

mkVar :: Text -> Type
mkVar = VarT . mkName . T.unpack

renderType, renderTypeSource :: (HasRenderElem r, HasRenderParams r) => Type -> Sem r (Doc ())
renderType = renderType' tellImport
renderTypeSource = renderType'
  (\case
    n | n `elem` neverBootTypes -> tellImport n
    n                           -> tellSourceImport n
  )

renderType'
  :: (HasRenderElem r, HasRenderParams r)
  => (Name -> Sem r ())
  -> Type
  -> Sem r (Doc ())
renderType' importer t = do
  RenderParams {..} <- ask
  let removeModules = transformBi
        (\n ->
          if V.elem n alwaysQualifiedNames then n else mkName . nameBase $ n
        )
  traverse_
    importer
    [ n | n <- childrenBi t, not (isLower (Prelude.head (nameBase n))) ] -- TODO: do this properly
  pure
    . group -- All on one line, to work around brittany #277
    . pretty
    . unwords
    . words
    . pprint
    . removeModules
    $ t

-- TODO, do this properly lol
renderTypeHighPrec, renderTypeHighPrecSource
  :: ( HasRenderElem r
     , HasRenderParams r
     )
  => Type
  -> Sem r (Doc ())
renderTypeHighPrec = \case
  t@(ConT _) -> renderType t
  t@(VarT _) -> renderType t
  t          -> parens <$> renderType t

renderTypeHighPrecSource = \case
  t@(ConT _) -> renderTypeSource t
  t          -> parens <$> renderTypeSource t

neverBootTypes :: [Name]
neverBootTypes = [typeName (TyConName ":::")]

allTypeNames :: Type -> [Name]
allTypeNames = childrenBi

pattern (:@) :: Type -> Type -> Type
pattern a :@ b = AppT a b
infixl 2 :@

infixr 1 ~>, `arrowUniqueVars`
(~>) :: Type -> Type -> Type
a ~> b = ArrowT :@ a :@ b

arrowUniqueVars :: Type -> Type -> Type
arrowUniqueVars l r =
  let lVars           = List.nubOrd [ n | VarT n <- universe l ]
      rVars           = List.nubOrd [ n | VarT n <- universe r ]
      overlappingVars = List.intersect lVars rVars
      newVars = (mkName . pure <$> ['a' .. 'q']) List.\\ (lVars <> rVars)
      -- TODO, important, make sure we don't run out of names here
      varMap          = zip overlappingVars newVars
      newMap :: Name -> Name
      newMap v = fromMaybe v (List.lookup v varMap)
  in  l ~> transformBi newMap r