{-# language CPP #-}
module Graphics.Vulkan.Core12.Promoted_From_VK_KHR_separate_depth_stencil_layouts  ( PhysicalDeviceSeparateDepthStencilLayoutsFeatures(..)
                                                                                   , AttachmentReferenceStencilLayout(..)
                                                                                   , AttachmentDescriptionStencilLayout(..)
                                                                                   , ImageLayout(..)
                                                                                   , StructureType(..)
                                                                                   ) where

import Foreign.Marshal.Alloc (allocaBytesAligned)
import Foreign.Ptr (nullPtr)
import Foreign.Ptr (plusPtr)
import Data.Typeable (Typeable)
import Foreign.Storable (Storable)
import Foreign.Storable (Storable(peek))
import Foreign.Storable (Storable(poke))
import qualified Foreign.Storable (Storable(..))
import Foreign.Ptr (Ptr)
import Data.Kind (Type)
import Graphics.Vulkan.Core10.BaseType (bool32ToBool)
import Graphics.Vulkan.Core10.BaseType (boolToBool32)
import Graphics.Vulkan.Core10.BaseType (Bool32)
import Graphics.Vulkan.CStruct (FromCStruct)
import Graphics.Vulkan.CStruct (FromCStruct(..))
import Graphics.Vulkan.Core10.Enums.ImageLayout (ImageLayout)
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType)
import Graphics.Vulkan.CStruct (ToCStruct)
import Graphics.Vulkan.CStruct (ToCStruct(..))
import Graphics.Vulkan.Zero (Zero(..))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_ATTACHMENT_DESCRIPTION_STENCIL_LAYOUT))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_ATTACHMENT_REFERENCE_STENCIL_LAYOUT))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_PHYSICAL_DEVICE_SEPARATE_DEPTH_STENCIL_LAYOUTS_FEATURES))
import Graphics.Vulkan.Core10.Enums.ImageLayout (ImageLayout(..))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(..))
-- | VkPhysicalDeviceSeparateDepthStencilLayoutsFeatures - Structure
-- describing whether the implementation can do depth and stencil image
-- barriers separately
--
-- = Members
--
-- The members of the 'PhysicalDeviceSeparateDepthStencilLayoutsFeatures'
-- structure describe the following features:
--
-- = Description
--
-- If the 'PhysicalDeviceSeparateDepthStencilLayoutsFeatures' structure is
-- included in the @pNext@ chain of
-- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_get_physical_device_properties2.PhysicalDeviceFeatures2',
-- it is filled with values indicating whether the feature is supported.
-- 'PhysicalDeviceSeparateDepthStencilLayoutsFeatures' /can/ also be
-- included in the @pNext@ chain of
-- 'Graphics.Vulkan.Core10.Device.DeviceCreateInfo' to enable the feature.
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.BaseType.Bool32',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType'
data PhysicalDeviceSeparateDepthStencilLayoutsFeatures = PhysicalDeviceSeparateDepthStencilLayoutsFeatures
  { -- | @separateDepthStencilLayouts@ indicates whether the implementation
    -- supports a 'Graphics.Vulkan.Core10.OtherTypes.ImageMemoryBarrier' for a
    -- depth\/stencil image with only one of
    -- 'Graphics.Vulkan.Core10.Enums.ImageAspectFlagBits.IMAGE_ASPECT_DEPTH_BIT'
    -- or
    -- 'Graphics.Vulkan.Core10.Enums.ImageAspectFlagBits.IMAGE_ASPECT_STENCIL_BIT'
    -- set, and whether
    -- 'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_ATTACHMENT_OPTIMAL',
    -- 'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_READ_ONLY_OPTIMAL',
    -- 'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_STENCIL_ATTACHMENT_OPTIMAL',
    -- or
    -- 'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_STENCIL_READ_ONLY_OPTIMAL'
    -- can be used.
    separateDepthStencilLayouts :: Bool }
  deriving (Typeable)
deriving instance Show PhysicalDeviceSeparateDepthStencilLayoutsFeatures

instance ToCStruct PhysicalDeviceSeparateDepthStencilLayoutsFeatures where
  withCStruct x f = allocaBytesAligned 24 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p PhysicalDeviceSeparateDepthStencilLayoutsFeatures{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_PHYSICAL_DEVICE_SEPARATE_DEPTH_STENCIL_LAYOUTS_FEATURES)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr Bool32)) (boolToBool32 (separateDepthStencilLayouts))
    f
  cStructSize = 24
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_PHYSICAL_DEVICE_SEPARATE_DEPTH_STENCIL_LAYOUTS_FEATURES)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr Bool32)) (boolToBool32 (zero))
    f

instance FromCStruct PhysicalDeviceSeparateDepthStencilLayoutsFeatures where
  peekCStruct p = do
    separateDepthStencilLayouts <- peek @Bool32 ((p `plusPtr` 16 :: Ptr Bool32))
    pure $ PhysicalDeviceSeparateDepthStencilLayoutsFeatures
             (bool32ToBool separateDepthStencilLayouts)

instance Storable PhysicalDeviceSeparateDepthStencilLayoutsFeatures where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero PhysicalDeviceSeparateDepthStencilLayoutsFeatures where
  zero = PhysicalDeviceSeparateDepthStencilLayoutsFeatures
           zero


-- | VkAttachmentReferenceStencilLayout - Structure specifying an attachment
-- description
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Enums.ImageLayout.ImageLayout',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType'
data AttachmentReferenceStencilLayout = AttachmentReferenceStencilLayout
  { -- | @stencilLayout@ /must/ be a valid
    -- 'Graphics.Vulkan.Core10.Enums.ImageLayout.ImageLayout' value
    stencilLayout :: ImageLayout }
  deriving (Typeable)
deriving instance Show AttachmentReferenceStencilLayout

instance ToCStruct AttachmentReferenceStencilLayout where
  withCStruct x f = allocaBytesAligned 24 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p AttachmentReferenceStencilLayout{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_ATTACHMENT_REFERENCE_STENCIL_LAYOUT)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr ImageLayout)) (stencilLayout)
    f
  cStructSize = 24
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_ATTACHMENT_REFERENCE_STENCIL_LAYOUT)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr ImageLayout)) (zero)
    f

instance FromCStruct AttachmentReferenceStencilLayout where
  peekCStruct p = do
    stencilLayout <- peek @ImageLayout ((p `plusPtr` 16 :: Ptr ImageLayout))
    pure $ AttachmentReferenceStencilLayout
             stencilLayout

instance Storable AttachmentReferenceStencilLayout where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero AttachmentReferenceStencilLayout where
  zero = AttachmentReferenceStencilLayout
           zero


-- | VkAttachmentDescriptionStencilLayout - Structure specifying an
-- attachment description
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Enums.ImageLayout.ImageLayout',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType'
data AttachmentDescriptionStencilLayout = AttachmentDescriptionStencilLayout
  { -- | @stencilInitialLayout@ /must/ be a valid
    -- 'Graphics.Vulkan.Core10.Enums.ImageLayout.ImageLayout' value
    stencilInitialLayout :: ImageLayout
  , -- | @stencilFinalLayout@ /must/ be a valid
    -- 'Graphics.Vulkan.Core10.Enums.ImageLayout.ImageLayout' value
    stencilFinalLayout :: ImageLayout
  }
  deriving (Typeable)
deriving instance Show AttachmentDescriptionStencilLayout

instance ToCStruct AttachmentDescriptionStencilLayout where
  withCStruct x f = allocaBytesAligned 24 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p AttachmentDescriptionStencilLayout{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_ATTACHMENT_DESCRIPTION_STENCIL_LAYOUT)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr ImageLayout)) (stencilInitialLayout)
    poke ((p `plusPtr` 20 :: Ptr ImageLayout)) (stencilFinalLayout)
    f
  cStructSize = 24
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_ATTACHMENT_DESCRIPTION_STENCIL_LAYOUT)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr ImageLayout)) (zero)
    poke ((p `plusPtr` 20 :: Ptr ImageLayout)) (zero)
    f

instance FromCStruct AttachmentDescriptionStencilLayout where
  peekCStruct p = do
    stencilInitialLayout <- peek @ImageLayout ((p `plusPtr` 16 :: Ptr ImageLayout))
    stencilFinalLayout <- peek @ImageLayout ((p `plusPtr` 20 :: Ptr ImageLayout))
    pure $ AttachmentDescriptionStencilLayout
             stencilInitialLayout stencilFinalLayout

instance Storable AttachmentDescriptionStencilLayout where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero AttachmentDescriptionStencilLayout where
  zero = AttachmentDescriptionStencilLayout
           zero
           zero
