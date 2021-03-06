{-# LANGUAGE ParallelListComp #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DeriveAnyClass #-}
{-# OPTIONS_GHC -fplugin=Foreign.Storable.Generic.Plugin #-}
{-# OPTIONS_GHC -fplugin-opt=Foreign.Storable.Generic.Plugin:-v0 #-}

module Scene
  where

import           Control.Lens
import           Control.Monad.IO.Class
import           Control.Monad.Trans.Resource
import           Data.Bits
import           Data.Colour.RGBSpace
import           Data.Colour.RGBSpace.HSV
import           Data.Word
import           Foreign.Marshal.Array
import           Foreign.Ptr
import           Foreign.Storable.Generic
import           GHC.Generics                   ( Generic )
import           Linear.V3
import           Linear.V4
import           MonadVulkan
import           System.Random
import           Vulkan.Core10
import           Vulkan.Extensions.VK_KHR_acceleration_structure
import           Vulkan.Zero
import           VulkanMemoryAllocator

scene :: [Sphere]
scene =
  let n = 2000
  in
  [ Sphere (V4 (x*radius)
               (radius**2.4 * sin x)
               (radius**2.4 * cos x)
               (radius**1.3))
           (V4 r g b 1)
  | radius <- (**1.3) <$> [1, 1.1 ..]
  | x <- take n [0 ..]
  | V3 r g b <- pastels
  ]

pastels :: [V3 Float]
pastels =
  let (g1, (g2, g3)) = split <$> split (mkStdGen 2)
      hues           = randomRs (0, 360) g1
      sats           = randomRs (0.3, 0.5) g2
      vals           = randomRs (0.8, 1) g3
      cs             = zipWith3 hsv hues sats vals
  in  uncurryRGB V3 <$> cs

----------------------------------------------------------------
-- Vulkan
----------------------------------------------------------------

data SceneBuffers = SceneBuffers
  { sceneAabbs   :: Buffer
  , sceneSpheres :: Buffer
  , sceneSize    :: Word32
  }

makeSceneBuffers :: V SceneBuffers
makeSceneBuffers = do
  sceneAabbs <- initBuffer
    (   BUFFER_USAGE_ACCELERATION_STRUCTURE_BUILD_INPUT_READ_ONLY_BIT_KHR
    .|. BUFFER_USAGE_SHADER_DEVICE_ADDRESS_BIT
    )
    (sphereAABB <$> scene)

  sceneSpheres <- initBuffer BUFFER_USAGE_STORAGE_BUFFER_BIT scene

  let sceneSize = fromIntegral (length scene)

  pure SceneBuffers { .. }

----------------------------------------------------------------
-- Buffer tools
----------------------------------------------------------------

initBuffer :: forall a . Storable a => BufferUsageFlags -> [a] -> V Buffer
initBuffer usage xs = do
  let bufferSize = sizeOf (head xs) * length xs

  (_, (buf, allocation, _)) <- withBuffer'
    zero { flags = zero, size = fromIntegral bufferSize, usage }
    zero
      { requiredFlags = MEMORY_PROPERTY_HOST_VISIBLE_BIT
                          .|. MEMORY_PROPERTY_HOST_COHERENT_BIT
      }
  (unmapKey, p) <- withMappedMemory' allocation
  liftIO $ pokeArray (castPtr @() @a p) xs
  release unmapKey

  pure buf

----------------------------------------------------------------
-- Sphere
----------------------------------------------------------------

data Sphere = Sphere
  { spherePos   :: V4 Float
  , sphereColor :: V4 Float
  }
  deriving(Generic, GStorable)

sphereRadius :: Sphere -> Float
sphereRadius = view _w . spherePos

sphereOrigin :: Sphere -> V3 Float
sphereOrigin = view _xyz . spherePos

sphereAABB :: Sphere -> AabbPositionsKHR
sphereAABB s =
  let mini = sphereOrigin s - pure (sphereRadius s)
      maxi = sphereOrigin s + pure (sphereRadius s)
  in  AabbPositionsKHR (mini ^. _x)
                       (mini ^. _y)
                       (mini ^. _z)
                       (maxi ^. _x)
                       (maxi ^. _y)
                       (maxi ^. _z)
