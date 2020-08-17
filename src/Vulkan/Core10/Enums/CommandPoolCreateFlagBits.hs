{-# language CPP #-}
module Vulkan.Core10.Enums.CommandPoolCreateFlagBits  ( CommandPoolCreateFlagBits( COMMAND_POOL_CREATE_TRANSIENT_BIT
                                                                                 , COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT
                                                                                 , COMMAND_POOL_CREATE_PROTECTED_BIT
                                                                                 , ..
                                                                                 )
                                                      , CommandPoolCreateFlags
                                                      ) where

import GHC.Read (choose)
import GHC.Read (expectP)
import GHC.Read (parens)
import GHC.Show (showParen)
import GHC.Show (showString)
import Numeric (showHex)
import Text.ParserCombinators.ReadPrec ((+++))
import Text.ParserCombinators.ReadPrec (prec)
import Text.ParserCombinators.ReadPrec (step)
import Data.Bits (Bits)
import Foreign.Storable (Storable)
import GHC.Read (Read(readPrec))
import Text.Read.Lex (Lexeme(Ident))
import Vulkan.Core10.FundamentalTypes (Flags)
import Vulkan.Zero (Zero)
-- | VkCommandPoolCreateFlagBits - Bitmask specifying usage behavior for a
-- command pool
--
-- = See Also
--
-- 'CommandPoolCreateFlags'
newtype CommandPoolCreateFlagBits = CommandPoolCreateFlagBits Flags
  deriving newtype (Eq, Ord, Storable, Zero, Bits)

-- | 'COMMAND_POOL_CREATE_TRANSIENT_BIT' specifies that command buffers
-- allocated from the pool will be short-lived, meaning that they will be
-- reset or freed in a relatively short timeframe. This flag /may/ be used
-- by the implementation to control memory allocation behavior within the
-- pool.
pattern COMMAND_POOL_CREATE_TRANSIENT_BIT = CommandPoolCreateFlagBits 0x00000001
-- | 'COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT' allows any command buffer
-- allocated from a pool to be individually reset to the
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#commandbuffers-lifecycle initial state>;
-- either by calling 'Vulkan.Core10.CommandBuffer.resetCommandBuffer', or
-- via the implicit reset when calling
-- 'Vulkan.Core10.CommandBuffer.beginCommandBuffer'. If this flag is not
-- set on a pool, then 'Vulkan.Core10.CommandBuffer.resetCommandBuffer'
-- /must/ not be called for any command buffer allocated from that pool.
pattern COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT = CommandPoolCreateFlagBits 0x00000002
-- | 'COMMAND_POOL_CREATE_PROTECTED_BIT' specifies that command buffers
-- allocated from the pool are protected command buffers.
pattern COMMAND_POOL_CREATE_PROTECTED_BIT = CommandPoolCreateFlagBits 0x00000004

type CommandPoolCreateFlags = CommandPoolCreateFlagBits

instance Show CommandPoolCreateFlagBits where
  showsPrec p = \case
    COMMAND_POOL_CREATE_TRANSIENT_BIT -> showString "COMMAND_POOL_CREATE_TRANSIENT_BIT"
    COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT -> showString "COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT"
    COMMAND_POOL_CREATE_PROTECTED_BIT -> showString "COMMAND_POOL_CREATE_PROTECTED_BIT"
    CommandPoolCreateFlagBits x -> showParen (p >= 11) (showString "CommandPoolCreateFlagBits 0x" . showHex x)

instance Read CommandPoolCreateFlagBits where
  readPrec = parens (choose [("COMMAND_POOL_CREATE_TRANSIENT_BIT", pure COMMAND_POOL_CREATE_TRANSIENT_BIT)
                            , ("COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT", pure COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT)
                            , ("COMMAND_POOL_CREATE_PROTECTED_BIT", pure COMMAND_POOL_CREATE_PROTECTED_BIT)]
                     +++
                     prec 10 (do
                       expectP (Ident "CommandPoolCreateFlagBits")
                       v <- step readPrec
                       pure (CommandPoolCreateFlagBits v)))
