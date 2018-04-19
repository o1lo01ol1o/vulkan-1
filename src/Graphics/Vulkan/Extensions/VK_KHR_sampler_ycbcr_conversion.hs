{-# language Strict #-}
{-# language CPP #-}
{-# language PatternSynonyms #-}
{-# language OverloadedStrings #-}
{-# language DataKinds #-}
{-# language TypeOperators #-}

module Graphics.Vulkan.Extensions.VK_KHR_sampler_ycbcr_conversion
  ( pattern VK_KHR_SAMPLER_YCBCR_CONVERSION_SPEC_VERSION
  , pattern VK_KHR_SAMPLER_YCBCR_CONVERSION_EXTENSION_NAME
  , vkCreateSamplerYcbcrConversionKHR
  , vkDestroySamplerYcbcrConversionKHR
  , VkSamplerYcbcrModelConversionKHR
  , VkSamplerYcbcrRangeKHR
  , VkChromaLocationKHR
  , VkSamplerYcbcrConversionKHR
  , VkSamplerYcbcrConversionInfoKHR
  , pattern VkSamplerYcbcrConversionInfoKHR
  , VkSamplerYcbcrConversionCreateInfoKHR
  , pattern VkSamplerYcbcrConversionCreateInfoKHR
  , VkBindImagePlaneMemoryInfoKHR
  , pattern VkBindImagePlaneMemoryInfoKHR
  , VkImagePlaneMemoryRequirementsInfoKHR
  , pattern VkImagePlaneMemoryRequirementsInfoKHR
  , VkPhysicalDeviceSamplerYcbcrConversionFeaturesKHR
  , pattern VkPhysicalDeviceSamplerYcbcrConversionFeaturesKHR
  , VkSamplerYcbcrConversionImageFormatPropertiesKHR
  , pattern VkSamplerYcbcrConversionImageFormatPropertiesKHR
  , pattern VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_CREATE_INFO_KHR
  , pattern VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_INFO_KHR
  , pattern VK_STRUCTURE_TYPE_BIND_IMAGE_PLANE_MEMORY_INFO_KHR
  , pattern VK_STRUCTURE_TYPE_IMAGE_PLANE_MEMORY_REQUIREMENTS_INFO_KHR
  , pattern VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_YCBCR_CONVERSION_FEATURES_KHR
  , pattern VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_IMAGE_FORMAT_PROPERTIES_KHR
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_KHR_EXT
  , pattern VK_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_KHR
  , pattern VK_FORMAT_G8B8G8R8_422_UNORM_KHR
  , pattern VK_FORMAT_B8G8R8G8_422_UNORM_KHR
  , pattern VK_FORMAT_G8_B8_R8_3PLANE_420_UNORM_KHR
  , pattern VK_FORMAT_G8_B8R8_2PLANE_420_UNORM_KHR
  , pattern VK_FORMAT_G8_B8_R8_3PLANE_422_UNORM_KHR
  , pattern VK_FORMAT_G8_B8R8_2PLANE_422_UNORM_KHR
  , pattern VK_FORMAT_G8_B8_R8_3PLANE_444_UNORM_KHR
  , pattern VK_FORMAT_R10X6_UNORM_PACK16_KHR
  , pattern VK_FORMAT_R10X6G10X6_UNORM_2PACK16_KHR
  , pattern VK_FORMAT_R10X6G10X6B10X6A10X6_UNORM_4PACK16_KHR
  , pattern VK_FORMAT_G10X6B10X6G10X6R10X6_422_UNORM_4PACK16_KHR
  , pattern VK_FORMAT_B10X6G10X6R10X6G10X6_422_UNORM_4PACK16_KHR
  , pattern VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_420_UNORM_3PACK16_KHR
  , pattern VK_FORMAT_G10X6_B10X6R10X6_2PLANE_420_UNORM_3PACK16_KHR
  , pattern VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_422_UNORM_3PACK16_KHR
  , pattern VK_FORMAT_G10X6_B10X6R10X6_2PLANE_422_UNORM_3PACK16_KHR
  , pattern VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_444_UNORM_3PACK16_KHR
  , pattern VK_FORMAT_R12X4_UNORM_PACK16_KHR
  , pattern VK_FORMAT_R12X4G12X4_UNORM_2PACK16_KHR
  , pattern VK_FORMAT_R12X4G12X4B12X4A12X4_UNORM_4PACK16_KHR
  , pattern VK_FORMAT_G12X4B12X4G12X4R12X4_422_UNORM_4PACK16_KHR
  , pattern VK_FORMAT_B12X4G12X4R12X4G12X4_422_UNORM_4PACK16_KHR
  , pattern VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_420_UNORM_3PACK16_KHR
  , pattern VK_FORMAT_G12X4_B12X4R12X4_2PLANE_420_UNORM_3PACK16_KHR
  , pattern VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_422_UNORM_3PACK16_KHR
  , pattern VK_FORMAT_G12X4_B12X4R12X4_2PLANE_422_UNORM_3PACK16_KHR
  , pattern VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_444_UNORM_3PACK16_KHR
  , pattern VK_FORMAT_G16B16G16R16_422_UNORM_KHR
  , pattern VK_FORMAT_B16G16R16G16_422_UNORM_KHR
  , pattern VK_FORMAT_G16_B16_R16_3PLANE_420_UNORM_KHR
  , pattern VK_FORMAT_G16_B16R16_2PLANE_420_UNORM_KHR
  , pattern VK_FORMAT_G16_B16_R16_3PLANE_422_UNORM_KHR
  , pattern VK_FORMAT_G16_B16R16_2PLANE_422_UNORM_KHR
  , pattern VK_FORMAT_G16_B16_R16_3PLANE_444_UNORM_KHR
  , pattern VK_IMAGE_ASPECT_PLANE_0_BIT_KHR
  , pattern VK_IMAGE_ASPECT_PLANE_1_BIT_KHR
  , pattern VK_IMAGE_ASPECT_PLANE_2_BIT_KHR
  , pattern VK_IMAGE_CREATE_DISJOINT_BIT_KHR
  , pattern VK_FORMAT_FEATURE_MIDPOINT_CHROMA_SAMPLES_BIT_KHR
  , pattern VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER_BIT_KHR
  , pattern VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER_BIT_KHR
  , pattern VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_BIT_KHR
  , pattern VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE_BIT_KHR
  , pattern VK_FORMAT_FEATURE_DISJOINT_BIT_KHR
  , pattern VK_FORMAT_FEATURE_COSITED_CHROMA_SAMPLES_BIT_KHR
  , pattern VK_SAMPLER_YCBCR_MODEL_CONVERSION_RGB_IDENTITY_KHR
  , pattern VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_IDENTITY_KHR
  , pattern VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_709_KHR
  , pattern VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_601_KHR
  , pattern VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_2020_KHR
  , pattern VK_SAMPLER_YCBCR_RANGE_ITU_FULL_KHR
  , pattern VK_SAMPLER_YCBCR_RANGE_ITU_NARROW_KHR
  , pattern VK_CHROMA_LOCATION_COSITED_EVEN_KHR
  , pattern VK_CHROMA_LOCATION_MIDPOINT_KHR
  ) where

import Data.String
  ( IsString
  )
import Data.Word
  ( Word32
  )
import Foreign.Ptr
  ( Ptr
  )
import Graphics.Vulkan.NamedType
  ( (:::)
  )


import Graphics.Vulkan.Core10.Core
  ( VkObjectType(..)
  , VkBool32(..)
  , VkFormat(..)
  , VkStructureType(..)
  , VkResult(..)
  )
import Graphics.Vulkan.Core10.DeviceInitialization
  ( VkFormatFeatureFlagBits(..)
  , VkImageCreateFlagBits(..)
  , VkAllocationCallbacks(..)
  , VkDevice
  )
import Graphics.Vulkan.Core10.ImageView
  ( VkComponentMapping(..)
  )
import Graphics.Vulkan.Core10.Sampler
  ( VkFilter(..)
  )
import Graphics.Vulkan.Core10.SparseResourceMemoryManagement
  ( VkImageAspectFlagBits(..)
  )
import Graphics.Vulkan.Core11.Promoted_from_VK_KHR_sampler_ycbcr_conversion
  ( pattern VK_CHROMA_LOCATION_MIDPOINT
  , pattern VK_CHROMA_LOCATION_COSITED_EVEN
  , pattern VK_SAMPLER_YCBCR_RANGE_ITU_NARROW
  , pattern VK_SAMPLER_YCBCR_RANGE_ITU_FULL
  , pattern VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_2020
  , pattern VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_601
  , pattern VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_709
  , pattern VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_IDENTITY
  , pattern VK_SAMPLER_YCBCR_MODEL_CONVERSION_RGB_IDENTITY
  , pattern VK_FORMAT_FEATURE_COSITED_CHROMA_SAMPLES_BIT
  , pattern VK_FORMAT_FEATURE_DISJOINT_BIT
  , pattern VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE_BIT
  , pattern VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_BIT
  , pattern VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER_BIT
  , pattern VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER_BIT
  , pattern VK_FORMAT_FEATURE_MIDPOINT_CHROMA_SAMPLES_BIT
  , pattern VK_IMAGE_CREATE_DISJOINT_BIT
  , pattern VK_IMAGE_ASPECT_PLANE_2_BIT
  , pattern VK_IMAGE_ASPECT_PLANE_1_BIT
  , pattern VK_IMAGE_ASPECT_PLANE_0_BIT
  , pattern VK_FORMAT_G16_B16_R16_3PLANE_444_UNORM
  , pattern VK_FORMAT_G16_B16R16_2PLANE_422_UNORM
  , pattern VK_FORMAT_G16_B16_R16_3PLANE_422_UNORM
  , pattern VK_FORMAT_G16_B16R16_2PLANE_420_UNORM
  , pattern VK_FORMAT_G16_B16_R16_3PLANE_420_UNORM
  , pattern VK_FORMAT_B16G16R16G16_422_UNORM
  , pattern VK_FORMAT_G16B16G16R16_422_UNORM
  , pattern VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_444_UNORM_3PACK16
  , pattern VK_FORMAT_G12X4_B12X4R12X4_2PLANE_422_UNORM_3PACK16
  , pattern VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_422_UNORM_3PACK16
  , pattern VK_FORMAT_G12X4_B12X4R12X4_2PLANE_420_UNORM_3PACK16
  , pattern VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_420_UNORM_3PACK16
  , pattern VK_FORMAT_B12X4G12X4R12X4G12X4_422_UNORM_4PACK16
  , pattern VK_FORMAT_G12X4B12X4G12X4R12X4_422_UNORM_4PACK16
  , pattern VK_FORMAT_R12X4G12X4B12X4A12X4_UNORM_4PACK16
  , pattern VK_FORMAT_R12X4G12X4_UNORM_2PACK16
  , pattern VK_FORMAT_R12X4_UNORM_PACK16
  , pattern VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_444_UNORM_3PACK16
  , pattern VK_FORMAT_G10X6_B10X6R10X6_2PLANE_422_UNORM_3PACK16
  , pattern VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_422_UNORM_3PACK16
  , pattern VK_FORMAT_G10X6_B10X6R10X6_2PLANE_420_UNORM_3PACK16
  , pattern VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_420_UNORM_3PACK16
  , pattern VK_FORMAT_B10X6G10X6R10X6G10X6_422_UNORM_4PACK16
  , pattern VK_FORMAT_G10X6B10X6G10X6R10X6_422_UNORM_4PACK16
  , pattern VK_FORMAT_R10X6G10X6B10X6A10X6_UNORM_4PACK16
  , pattern VK_FORMAT_R10X6G10X6_UNORM_2PACK16
  , pattern VK_FORMAT_R10X6_UNORM_PACK16
  , pattern VK_FORMAT_G8_B8_R8_3PLANE_444_UNORM
  , pattern VK_FORMAT_G8_B8R8_2PLANE_422_UNORM
  , pattern VK_FORMAT_G8_B8_R8_3PLANE_422_UNORM
  , pattern VK_FORMAT_G8_B8R8_2PLANE_420_UNORM
  , pattern VK_FORMAT_G8_B8_R8_3PLANE_420_UNORM
  , pattern VK_FORMAT_B8G8R8G8_422_UNORM
  , pattern VK_FORMAT_G8B8G8R8_422_UNORM
  , pattern VK_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION
  , pattern VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_IMAGE_FORMAT_PROPERTIES
  , pattern VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_YCBCR_CONVERSION_FEATURES
  , pattern VK_STRUCTURE_TYPE_IMAGE_PLANE_MEMORY_REQUIREMENTS_INFO
  , pattern VK_STRUCTURE_TYPE_BIND_IMAGE_PLANE_MEMORY_INFO
  , pattern VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_INFO
  , pattern VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_CREATE_INFO
  , VkSamplerYcbcrConversionImageFormatProperties(..)
  , VkPhysicalDeviceSamplerYcbcrConversionFeatures(..)
  , VkImagePlaneMemoryRequirementsInfo(..)
  , VkBindImagePlaneMemoryInfo(..)
  , VkSamplerYcbcrConversionInfo(..)
  , VkChromaLocation(..)
  , VkSamplerYcbcrRange(..)
  , VkSamplerYcbcrModelConversion(..)
  , vkDestroySamplerYcbcrConversion
  , VkSamplerYcbcrConversion
  , VkSamplerYcbcrConversionCreateInfo(..)
  , vkCreateSamplerYcbcrConversion
  )
import Graphics.Vulkan.Extensions.VK_EXT_debug_report
  ( VkDebugReportObjectTypeEXT(..)
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_EXT
  )


-- No documentation found for TopLevel "VK_KHR_SAMPLER_YCBCR_CONVERSION_SPEC_VERSION"
pattern VK_KHR_SAMPLER_YCBCR_CONVERSION_SPEC_VERSION :: Integral a => a
pattern VK_KHR_SAMPLER_YCBCR_CONVERSION_SPEC_VERSION = 1
-- No documentation found for TopLevel "VK_KHR_SAMPLER_YCBCR_CONVERSION_EXTENSION_NAME"
pattern VK_KHR_SAMPLER_YCBCR_CONVERSION_EXTENSION_NAME :: (Eq a ,IsString a) => a
pattern VK_KHR_SAMPLER_YCBCR_CONVERSION_EXTENSION_NAME = "VK_KHR_sampler_ycbcr_conversion"
-- No documentation found for TopLevel "vkCreateSamplerYcbcrConversionKHR"
vkCreateSamplerYcbcrConversionKHR :: ("device" ::: VkDevice) -> ("pCreateInfo" ::: Ptr VkSamplerYcbcrConversionCreateInfo) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> ("pYcbcrConversion" ::: Ptr VkSamplerYcbcrConversion) -> IO VkResult
vkCreateSamplerYcbcrConversionKHR = vkCreateSamplerYcbcrConversion
-- No documentation found for TopLevel "vkDestroySamplerYcbcrConversionKHR"
vkDestroySamplerYcbcrConversionKHR :: ("device" ::: VkDevice) -> ("ycbcrConversion" ::: VkSamplerYcbcrConversion) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> IO ()
vkDestroySamplerYcbcrConversionKHR = vkDestroySamplerYcbcrConversion
-- No documentation found for TopLevel "VkSamplerYcbcrModelConversionKHR"
type VkSamplerYcbcrModelConversionKHR = VkSamplerYcbcrModelConversion
-- No documentation found for TopLevel "VkSamplerYcbcrRangeKHR"
type VkSamplerYcbcrRangeKHR = VkSamplerYcbcrRange
-- No documentation found for TopLevel "VkChromaLocationKHR"
type VkChromaLocationKHR = VkChromaLocation
-- No documentation found for TopLevel "VkSamplerYcbcrConversionKHR"
type VkSamplerYcbcrConversionKHR = VkSamplerYcbcrConversion
-- No documentation found for TopLevel "VkSamplerYcbcrConversionInfoKHR"
type VkSamplerYcbcrConversionInfoKHR = VkSamplerYcbcrConversionInfo


-- No documentation found for TopLevel "VkSamplerYcbcrConversionInfoKHR"
pattern VkSamplerYcbcrConversionInfoKHR :: ("sType" ::: VkStructureType) -> ("pNext" ::: Ptr ()) -> ("conversion" ::: VkSamplerYcbcrConversion) -> VkSamplerYcbcrConversionInfoKHR
pattern VkSamplerYcbcrConversionInfoKHR vkSType vkPNext vkConversion = VkSamplerYcbcrConversionInfo vkSType vkPNext vkConversion
-- No documentation found for TopLevel "VkSamplerYcbcrConversionCreateInfoKHR"
type VkSamplerYcbcrConversionCreateInfoKHR = VkSamplerYcbcrConversionCreateInfo


-- No documentation found for TopLevel "VkSamplerYcbcrConversionCreateInfoKHR"
pattern VkSamplerYcbcrConversionCreateInfoKHR :: ("sType" ::: VkStructureType) -> ("pNext" ::: Ptr ()) -> ("format" ::: VkFormat) -> ("ycbcrModel" ::: VkSamplerYcbcrModelConversion) -> ("ycbcrRange" ::: VkSamplerYcbcrRange) -> ("components" ::: VkComponentMapping) -> ("xChromaOffset" ::: VkChromaLocation) -> ("yChromaOffset" ::: VkChromaLocation) -> ("chromaFilter" ::: VkFilter) -> ("forceExplicitReconstruction" ::: VkBool32) -> VkSamplerYcbcrConversionCreateInfoKHR
pattern VkSamplerYcbcrConversionCreateInfoKHR vkSType vkPNext vkFormat vkYcbcrModel vkYcbcrRange vkComponents vkXChromaOffset vkYChromaOffset vkChromaFilter vkForceExplicitReconstruction = VkSamplerYcbcrConversionCreateInfo vkSType vkPNext vkFormat vkYcbcrModel vkYcbcrRange vkComponents vkXChromaOffset vkYChromaOffset vkChromaFilter vkForceExplicitReconstruction
-- No documentation found for TopLevel "VkBindImagePlaneMemoryInfoKHR"
type VkBindImagePlaneMemoryInfoKHR = VkBindImagePlaneMemoryInfo


-- No documentation found for TopLevel "VkBindImagePlaneMemoryInfoKHR"
pattern VkBindImagePlaneMemoryInfoKHR :: ("sType" ::: VkStructureType) -> ("pNext" ::: Ptr ()) -> ("planeAspect" ::: VkImageAspectFlagBits) -> VkBindImagePlaneMemoryInfoKHR
pattern VkBindImagePlaneMemoryInfoKHR vkSType vkPNext vkPlaneAspect = VkBindImagePlaneMemoryInfo vkSType vkPNext vkPlaneAspect
-- No documentation found for TopLevel "VkImagePlaneMemoryRequirementsInfoKHR"
type VkImagePlaneMemoryRequirementsInfoKHR = VkImagePlaneMemoryRequirementsInfo


-- No documentation found for TopLevel "VkImagePlaneMemoryRequirementsInfoKHR"
pattern VkImagePlaneMemoryRequirementsInfoKHR :: ("sType" ::: VkStructureType) -> ("pNext" ::: Ptr ()) -> ("planeAspect" ::: VkImageAspectFlagBits) -> VkImagePlaneMemoryRequirementsInfoKHR
pattern VkImagePlaneMemoryRequirementsInfoKHR vkSType vkPNext vkPlaneAspect = VkImagePlaneMemoryRequirementsInfo vkSType vkPNext vkPlaneAspect
-- No documentation found for TopLevel "VkPhysicalDeviceSamplerYcbcrConversionFeaturesKHR"
type VkPhysicalDeviceSamplerYcbcrConversionFeaturesKHR = VkPhysicalDeviceSamplerYcbcrConversionFeatures


-- No documentation found for TopLevel "VkPhysicalDeviceSamplerYcbcrConversionFeaturesKHR"
pattern VkPhysicalDeviceSamplerYcbcrConversionFeaturesKHR :: ("sType" ::: VkStructureType) -> ("pNext" ::: Ptr ()) -> ("samplerYcbcrConversion" ::: VkBool32) -> VkPhysicalDeviceSamplerYcbcrConversionFeaturesKHR
pattern VkPhysicalDeviceSamplerYcbcrConversionFeaturesKHR vkSType vkPNext vkSamplerYcbcrConversion = VkPhysicalDeviceSamplerYcbcrConversionFeatures vkSType vkPNext vkSamplerYcbcrConversion
-- No documentation found for TopLevel "VkSamplerYcbcrConversionImageFormatPropertiesKHR"
type VkSamplerYcbcrConversionImageFormatPropertiesKHR = VkSamplerYcbcrConversionImageFormatProperties


-- No documentation found for TopLevel "VkSamplerYcbcrConversionImageFormatPropertiesKHR"
pattern VkSamplerYcbcrConversionImageFormatPropertiesKHR :: ("sType" ::: VkStructureType) -> ("pNext" ::: Ptr ()) -> ("combinedImageSamplerDescriptorCount" ::: Word32) -> VkSamplerYcbcrConversionImageFormatPropertiesKHR
pattern VkSamplerYcbcrConversionImageFormatPropertiesKHR vkSType vkPNext vkCombinedImageSamplerDescriptorCount = VkSamplerYcbcrConversionImageFormatProperties vkSType vkPNext vkCombinedImageSamplerDescriptorCount
-- No documentation found for TopLevel "VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_CREATE_INFO_KHR"
pattern VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_CREATE_INFO_KHR :: VkStructureType
pattern VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_CREATE_INFO_KHR = VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_CREATE_INFO
-- No documentation found for TopLevel "VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_INFO_KHR"
pattern VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_INFO_KHR :: VkStructureType
pattern VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_INFO_KHR = VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_INFO
-- No documentation found for TopLevel "VK_STRUCTURE_TYPE_BIND_IMAGE_PLANE_MEMORY_INFO_KHR"
pattern VK_STRUCTURE_TYPE_BIND_IMAGE_PLANE_MEMORY_INFO_KHR :: VkStructureType
pattern VK_STRUCTURE_TYPE_BIND_IMAGE_PLANE_MEMORY_INFO_KHR = VK_STRUCTURE_TYPE_BIND_IMAGE_PLANE_MEMORY_INFO
-- No documentation found for TopLevel "VK_STRUCTURE_TYPE_IMAGE_PLANE_MEMORY_REQUIREMENTS_INFO_KHR"
pattern VK_STRUCTURE_TYPE_IMAGE_PLANE_MEMORY_REQUIREMENTS_INFO_KHR :: VkStructureType
pattern VK_STRUCTURE_TYPE_IMAGE_PLANE_MEMORY_REQUIREMENTS_INFO_KHR = VK_STRUCTURE_TYPE_IMAGE_PLANE_MEMORY_REQUIREMENTS_INFO
-- No documentation found for TopLevel "VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_YCBCR_CONVERSION_FEATURES_KHR"
pattern VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_YCBCR_CONVERSION_FEATURES_KHR :: VkStructureType
pattern VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_YCBCR_CONVERSION_FEATURES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_YCBCR_CONVERSION_FEATURES
-- No documentation found for TopLevel "VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_IMAGE_FORMAT_PROPERTIES_KHR"
pattern VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_IMAGE_FORMAT_PROPERTIES_KHR :: VkStructureType
pattern VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_IMAGE_FORMAT_PROPERTIES_KHR = VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_IMAGE_FORMAT_PROPERTIES
-- No documentation found for TopLevel "VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_KHR_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_KHR_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_KHR_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_EXT
-- No documentation found for TopLevel "VK_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_KHR"
pattern VK_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_KHR :: VkObjectType
pattern VK_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_KHR = VK_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION
-- No documentation found for TopLevel "VK_FORMAT_G8B8G8R8_422_UNORM_KHR"
pattern VK_FORMAT_G8B8G8R8_422_UNORM_KHR :: VkFormat
pattern VK_FORMAT_G8B8G8R8_422_UNORM_KHR = VK_FORMAT_G8B8G8R8_422_UNORM
-- No documentation found for TopLevel "VK_FORMAT_B8G8R8G8_422_UNORM_KHR"
pattern VK_FORMAT_B8G8R8G8_422_UNORM_KHR :: VkFormat
pattern VK_FORMAT_B8G8R8G8_422_UNORM_KHR = VK_FORMAT_B8G8R8G8_422_UNORM
-- No documentation found for TopLevel "VK_FORMAT_G8_B8_R8_3PLANE_420_UNORM_KHR"
pattern VK_FORMAT_G8_B8_R8_3PLANE_420_UNORM_KHR :: VkFormat
pattern VK_FORMAT_G8_B8_R8_3PLANE_420_UNORM_KHR = VK_FORMAT_G8_B8_R8_3PLANE_420_UNORM
-- No documentation found for TopLevel "VK_FORMAT_G8_B8R8_2PLANE_420_UNORM_KHR"
pattern VK_FORMAT_G8_B8R8_2PLANE_420_UNORM_KHR :: VkFormat
pattern VK_FORMAT_G8_B8R8_2PLANE_420_UNORM_KHR = VK_FORMAT_G8_B8R8_2PLANE_420_UNORM
-- No documentation found for TopLevel "VK_FORMAT_G8_B8_R8_3PLANE_422_UNORM_KHR"
pattern VK_FORMAT_G8_B8_R8_3PLANE_422_UNORM_KHR :: VkFormat
pattern VK_FORMAT_G8_B8_R8_3PLANE_422_UNORM_KHR = VK_FORMAT_G8_B8_R8_3PLANE_422_UNORM
-- No documentation found for TopLevel "VK_FORMAT_G8_B8R8_2PLANE_422_UNORM_KHR"
pattern VK_FORMAT_G8_B8R8_2PLANE_422_UNORM_KHR :: VkFormat
pattern VK_FORMAT_G8_B8R8_2PLANE_422_UNORM_KHR = VK_FORMAT_G8_B8R8_2PLANE_422_UNORM
-- No documentation found for TopLevel "VK_FORMAT_G8_B8_R8_3PLANE_444_UNORM_KHR"
pattern VK_FORMAT_G8_B8_R8_3PLANE_444_UNORM_KHR :: VkFormat
pattern VK_FORMAT_G8_B8_R8_3PLANE_444_UNORM_KHR = VK_FORMAT_G8_B8_R8_3PLANE_444_UNORM
-- No documentation found for TopLevel "VK_FORMAT_R10X6_UNORM_PACK16_KHR"
pattern VK_FORMAT_R10X6_UNORM_PACK16_KHR :: VkFormat
pattern VK_FORMAT_R10X6_UNORM_PACK16_KHR = VK_FORMAT_R10X6_UNORM_PACK16
-- No documentation found for TopLevel "VK_FORMAT_R10X6G10X6_UNORM_2PACK16_KHR"
pattern VK_FORMAT_R10X6G10X6_UNORM_2PACK16_KHR :: VkFormat
pattern VK_FORMAT_R10X6G10X6_UNORM_2PACK16_KHR = VK_FORMAT_R10X6G10X6_UNORM_2PACK16
-- No documentation found for TopLevel "VK_FORMAT_R10X6G10X6B10X6A10X6_UNORM_4PACK16_KHR"
pattern VK_FORMAT_R10X6G10X6B10X6A10X6_UNORM_4PACK16_KHR :: VkFormat
pattern VK_FORMAT_R10X6G10X6B10X6A10X6_UNORM_4PACK16_KHR = VK_FORMAT_R10X6G10X6B10X6A10X6_UNORM_4PACK16
-- No documentation found for TopLevel "VK_FORMAT_G10X6B10X6G10X6R10X6_422_UNORM_4PACK16_KHR"
pattern VK_FORMAT_G10X6B10X6G10X6R10X6_422_UNORM_4PACK16_KHR :: VkFormat
pattern VK_FORMAT_G10X6B10X6G10X6R10X6_422_UNORM_4PACK16_KHR = VK_FORMAT_G10X6B10X6G10X6R10X6_422_UNORM_4PACK16
-- No documentation found for TopLevel "VK_FORMAT_B10X6G10X6R10X6G10X6_422_UNORM_4PACK16_KHR"
pattern VK_FORMAT_B10X6G10X6R10X6G10X6_422_UNORM_4PACK16_KHR :: VkFormat
pattern VK_FORMAT_B10X6G10X6R10X6G10X6_422_UNORM_4PACK16_KHR = VK_FORMAT_B10X6G10X6R10X6G10X6_422_UNORM_4PACK16
-- No documentation found for TopLevel "VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_420_UNORM_3PACK16_KHR"
pattern VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_420_UNORM_3PACK16_KHR :: VkFormat
pattern VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_420_UNORM_3PACK16_KHR = VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_420_UNORM_3PACK16
-- No documentation found for TopLevel "VK_FORMAT_G10X6_B10X6R10X6_2PLANE_420_UNORM_3PACK16_KHR"
pattern VK_FORMAT_G10X6_B10X6R10X6_2PLANE_420_UNORM_3PACK16_KHR :: VkFormat
pattern VK_FORMAT_G10X6_B10X6R10X6_2PLANE_420_UNORM_3PACK16_KHR = VK_FORMAT_G10X6_B10X6R10X6_2PLANE_420_UNORM_3PACK16
-- No documentation found for TopLevel "VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_422_UNORM_3PACK16_KHR"
pattern VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_422_UNORM_3PACK16_KHR :: VkFormat
pattern VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_422_UNORM_3PACK16_KHR = VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_422_UNORM_3PACK16
-- No documentation found for TopLevel "VK_FORMAT_G10X6_B10X6R10X6_2PLANE_422_UNORM_3PACK16_KHR"
pattern VK_FORMAT_G10X6_B10X6R10X6_2PLANE_422_UNORM_3PACK16_KHR :: VkFormat
pattern VK_FORMAT_G10X6_B10X6R10X6_2PLANE_422_UNORM_3PACK16_KHR = VK_FORMAT_G10X6_B10X6R10X6_2PLANE_422_UNORM_3PACK16
-- No documentation found for TopLevel "VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_444_UNORM_3PACK16_KHR"
pattern VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_444_UNORM_3PACK16_KHR :: VkFormat
pattern VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_444_UNORM_3PACK16_KHR = VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_444_UNORM_3PACK16
-- No documentation found for TopLevel "VK_FORMAT_R12X4_UNORM_PACK16_KHR"
pattern VK_FORMAT_R12X4_UNORM_PACK16_KHR :: VkFormat
pattern VK_FORMAT_R12X4_UNORM_PACK16_KHR = VK_FORMAT_R12X4_UNORM_PACK16
-- No documentation found for TopLevel "VK_FORMAT_R12X4G12X4_UNORM_2PACK16_KHR"
pattern VK_FORMAT_R12X4G12X4_UNORM_2PACK16_KHR :: VkFormat
pattern VK_FORMAT_R12X4G12X4_UNORM_2PACK16_KHR = VK_FORMAT_R12X4G12X4_UNORM_2PACK16
-- No documentation found for TopLevel "VK_FORMAT_R12X4G12X4B12X4A12X4_UNORM_4PACK16_KHR"
pattern VK_FORMAT_R12X4G12X4B12X4A12X4_UNORM_4PACK16_KHR :: VkFormat
pattern VK_FORMAT_R12X4G12X4B12X4A12X4_UNORM_4PACK16_KHR = VK_FORMAT_R12X4G12X4B12X4A12X4_UNORM_4PACK16
-- No documentation found for TopLevel "VK_FORMAT_G12X4B12X4G12X4R12X4_422_UNORM_4PACK16_KHR"
pattern VK_FORMAT_G12X4B12X4G12X4R12X4_422_UNORM_4PACK16_KHR :: VkFormat
pattern VK_FORMAT_G12X4B12X4G12X4R12X4_422_UNORM_4PACK16_KHR = VK_FORMAT_G12X4B12X4G12X4R12X4_422_UNORM_4PACK16
-- No documentation found for TopLevel "VK_FORMAT_B12X4G12X4R12X4G12X4_422_UNORM_4PACK16_KHR"
pattern VK_FORMAT_B12X4G12X4R12X4G12X4_422_UNORM_4PACK16_KHR :: VkFormat
pattern VK_FORMAT_B12X4G12X4R12X4G12X4_422_UNORM_4PACK16_KHR = VK_FORMAT_B12X4G12X4R12X4G12X4_422_UNORM_4PACK16
-- No documentation found for TopLevel "VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_420_UNORM_3PACK16_KHR"
pattern VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_420_UNORM_3PACK16_KHR :: VkFormat
pattern VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_420_UNORM_3PACK16_KHR = VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_420_UNORM_3PACK16
-- No documentation found for TopLevel "VK_FORMAT_G12X4_B12X4R12X4_2PLANE_420_UNORM_3PACK16_KHR"
pattern VK_FORMAT_G12X4_B12X4R12X4_2PLANE_420_UNORM_3PACK16_KHR :: VkFormat
pattern VK_FORMAT_G12X4_B12X4R12X4_2PLANE_420_UNORM_3PACK16_KHR = VK_FORMAT_G12X4_B12X4R12X4_2PLANE_420_UNORM_3PACK16
-- No documentation found for TopLevel "VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_422_UNORM_3PACK16_KHR"
pattern VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_422_UNORM_3PACK16_KHR :: VkFormat
pattern VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_422_UNORM_3PACK16_KHR = VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_422_UNORM_3PACK16
-- No documentation found for TopLevel "VK_FORMAT_G12X4_B12X4R12X4_2PLANE_422_UNORM_3PACK16_KHR"
pattern VK_FORMAT_G12X4_B12X4R12X4_2PLANE_422_UNORM_3PACK16_KHR :: VkFormat
pattern VK_FORMAT_G12X4_B12X4R12X4_2PLANE_422_UNORM_3PACK16_KHR = VK_FORMAT_G12X4_B12X4R12X4_2PLANE_422_UNORM_3PACK16
-- No documentation found for TopLevel "VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_444_UNORM_3PACK16_KHR"
pattern VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_444_UNORM_3PACK16_KHR :: VkFormat
pattern VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_444_UNORM_3PACK16_KHR = VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_444_UNORM_3PACK16
-- No documentation found for TopLevel "VK_FORMAT_G16B16G16R16_422_UNORM_KHR"
pattern VK_FORMAT_G16B16G16R16_422_UNORM_KHR :: VkFormat
pattern VK_FORMAT_G16B16G16R16_422_UNORM_KHR = VK_FORMAT_G16B16G16R16_422_UNORM
-- No documentation found for TopLevel "VK_FORMAT_B16G16R16G16_422_UNORM_KHR"
pattern VK_FORMAT_B16G16R16G16_422_UNORM_KHR :: VkFormat
pattern VK_FORMAT_B16G16R16G16_422_UNORM_KHR = VK_FORMAT_B16G16R16G16_422_UNORM
-- No documentation found for TopLevel "VK_FORMAT_G16_B16_R16_3PLANE_420_UNORM_KHR"
pattern VK_FORMAT_G16_B16_R16_3PLANE_420_UNORM_KHR :: VkFormat
pattern VK_FORMAT_G16_B16_R16_3PLANE_420_UNORM_KHR = VK_FORMAT_G16_B16_R16_3PLANE_420_UNORM
-- No documentation found for TopLevel "VK_FORMAT_G16_B16R16_2PLANE_420_UNORM_KHR"
pattern VK_FORMAT_G16_B16R16_2PLANE_420_UNORM_KHR :: VkFormat
pattern VK_FORMAT_G16_B16R16_2PLANE_420_UNORM_KHR = VK_FORMAT_G16_B16R16_2PLANE_420_UNORM
-- No documentation found for TopLevel "VK_FORMAT_G16_B16_R16_3PLANE_422_UNORM_KHR"
pattern VK_FORMAT_G16_B16_R16_3PLANE_422_UNORM_KHR :: VkFormat
pattern VK_FORMAT_G16_B16_R16_3PLANE_422_UNORM_KHR = VK_FORMAT_G16_B16_R16_3PLANE_422_UNORM
-- No documentation found for TopLevel "VK_FORMAT_G16_B16R16_2PLANE_422_UNORM_KHR"
pattern VK_FORMAT_G16_B16R16_2PLANE_422_UNORM_KHR :: VkFormat
pattern VK_FORMAT_G16_B16R16_2PLANE_422_UNORM_KHR = VK_FORMAT_G16_B16R16_2PLANE_422_UNORM
-- No documentation found for TopLevel "VK_FORMAT_G16_B16_R16_3PLANE_444_UNORM_KHR"
pattern VK_FORMAT_G16_B16_R16_3PLANE_444_UNORM_KHR :: VkFormat
pattern VK_FORMAT_G16_B16_R16_3PLANE_444_UNORM_KHR = VK_FORMAT_G16_B16_R16_3PLANE_444_UNORM
-- No documentation found for TopLevel "VK_IMAGE_ASPECT_PLANE_0_BIT_KHR"
pattern VK_IMAGE_ASPECT_PLANE_0_BIT_KHR :: VkImageAspectFlagBits
pattern VK_IMAGE_ASPECT_PLANE_0_BIT_KHR = VK_IMAGE_ASPECT_PLANE_0_BIT
-- No documentation found for TopLevel "VK_IMAGE_ASPECT_PLANE_1_BIT_KHR"
pattern VK_IMAGE_ASPECT_PLANE_1_BIT_KHR :: VkImageAspectFlagBits
pattern VK_IMAGE_ASPECT_PLANE_1_BIT_KHR = VK_IMAGE_ASPECT_PLANE_1_BIT
-- No documentation found for TopLevel "VK_IMAGE_ASPECT_PLANE_2_BIT_KHR"
pattern VK_IMAGE_ASPECT_PLANE_2_BIT_KHR :: VkImageAspectFlagBits
pattern VK_IMAGE_ASPECT_PLANE_2_BIT_KHR = VK_IMAGE_ASPECT_PLANE_2_BIT
-- No documentation found for TopLevel "VK_IMAGE_CREATE_DISJOINT_BIT_KHR"
pattern VK_IMAGE_CREATE_DISJOINT_BIT_KHR :: VkImageCreateFlagBits
pattern VK_IMAGE_CREATE_DISJOINT_BIT_KHR = VK_IMAGE_CREATE_DISJOINT_BIT
-- No documentation found for TopLevel "VK_FORMAT_FEATURE_MIDPOINT_CHROMA_SAMPLES_BIT_KHR"
pattern VK_FORMAT_FEATURE_MIDPOINT_CHROMA_SAMPLES_BIT_KHR :: VkFormatFeatureFlagBits
pattern VK_FORMAT_FEATURE_MIDPOINT_CHROMA_SAMPLES_BIT_KHR = VK_FORMAT_FEATURE_MIDPOINT_CHROMA_SAMPLES_BIT
-- No documentation found for TopLevel "VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER_BIT_KHR"
pattern VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER_BIT_KHR :: VkFormatFeatureFlagBits
pattern VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER_BIT_KHR = VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER_BIT
-- No documentation found for TopLevel "VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER_BIT_KHR"
pattern VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER_BIT_KHR :: VkFormatFeatureFlagBits
pattern VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER_BIT_KHR = VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER_BIT
-- No documentation found for TopLevel "VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_BIT_KHR"
pattern VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_BIT_KHR :: VkFormatFeatureFlagBits
pattern VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_BIT_KHR = VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_BIT
-- No documentation found for TopLevel "VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE_BIT_KHR"
pattern VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE_BIT_KHR :: VkFormatFeatureFlagBits
pattern VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE_BIT_KHR = VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE_BIT
-- No documentation found for TopLevel "VK_FORMAT_FEATURE_DISJOINT_BIT_KHR"
pattern VK_FORMAT_FEATURE_DISJOINT_BIT_KHR :: VkFormatFeatureFlagBits
pattern VK_FORMAT_FEATURE_DISJOINT_BIT_KHR = VK_FORMAT_FEATURE_DISJOINT_BIT
-- No documentation found for TopLevel "VK_FORMAT_FEATURE_COSITED_CHROMA_SAMPLES_BIT_KHR"
pattern VK_FORMAT_FEATURE_COSITED_CHROMA_SAMPLES_BIT_KHR :: VkFormatFeatureFlagBits
pattern VK_FORMAT_FEATURE_COSITED_CHROMA_SAMPLES_BIT_KHR = VK_FORMAT_FEATURE_COSITED_CHROMA_SAMPLES_BIT
-- No documentation found for TopLevel "VK_SAMPLER_YCBCR_MODEL_CONVERSION_RGB_IDENTITY_KHR"
pattern VK_SAMPLER_YCBCR_MODEL_CONVERSION_RGB_IDENTITY_KHR :: VkSamplerYcbcrModelConversion
pattern VK_SAMPLER_YCBCR_MODEL_CONVERSION_RGB_IDENTITY_KHR = VK_SAMPLER_YCBCR_MODEL_CONVERSION_RGB_IDENTITY
-- No documentation found for TopLevel "VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_IDENTITY_KHR"
pattern VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_IDENTITY_KHR :: VkSamplerYcbcrModelConversion
pattern VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_IDENTITY_KHR = VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_IDENTITY
-- No documentation found for TopLevel "VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_709_KHR"
pattern VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_709_KHR :: VkSamplerYcbcrModelConversion
pattern VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_709_KHR = VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_709
-- No documentation found for TopLevel "VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_601_KHR"
pattern VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_601_KHR :: VkSamplerYcbcrModelConversion
pattern VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_601_KHR = VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_601
-- No documentation found for TopLevel "VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_2020_KHR"
pattern VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_2020_KHR :: VkSamplerYcbcrModelConversion
pattern VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_2020_KHR = VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_2020
-- No documentation found for TopLevel "VK_SAMPLER_YCBCR_RANGE_ITU_FULL_KHR"
pattern VK_SAMPLER_YCBCR_RANGE_ITU_FULL_KHR :: VkSamplerYcbcrRange
pattern VK_SAMPLER_YCBCR_RANGE_ITU_FULL_KHR = VK_SAMPLER_YCBCR_RANGE_ITU_FULL
-- No documentation found for TopLevel "VK_SAMPLER_YCBCR_RANGE_ITU_NARROW_KHR"
pattern VK_SAMPLER_YCBCR_RANGE_ITU_NARROW_KHR :: VkSamplerYcbcrRange
pattern VK_SAMPLER_YCBCR_RANGE_ITU_NARROW_KHR = VK_SAMPLER_YCBCR_RANGE_ITU_NARROW
-- No documentation found for TopLevel "VK_CHROMA_LOCATION_COSITED_EVEN_KHR"
pattern VK_CHROMA_LOCATION_COSITED_EVEN_KHR :: VkChromaLocation
pattern VK_CHROMA_LOCATION_COSITED_EVEN_KHR = VK_CHROMA_LOCATION_COSITED_EVEN
-- No documentation found for TopLevel "VK_CHROMA_LOCATION_MIDPOINT_KHR"
pattern VK_CHROMA_LOCATION_MIDPOINT_KHR :: VkChromaLocation
pattern VK_CHROMA_LOCATION_MIDPOINT_KHR = VK_CHROMA_LOCATION_MIDPOINT