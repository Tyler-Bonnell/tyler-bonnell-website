# Description ----------
## Source: Jadey Ryan's website source code: https://github.com/jadeynryan/jadey_website/blob/main/R/process-images.R

# Load Packages ----------
library(here)
library(fs)
library(magick)
library(purrr)

# Custom Functions ----------

## Convert from PNG to Webp
convert_to_webp <- function(png_file) {
  # Load the PNG image
  img <- image_read(png_file)
  
  # Construct the output WebP file name
  webp_file <- gsub("\\.png$", ".webp", png_file, ignore.case = TRUE)
  
  # Convert and save as WebP
  image_write(img, path = webp_file, format = "webp")
}

## Function to resize images
resize_image <- function(image_path, size) {
  # Load the PNG image
  img <- image_read(image_path)
  
  # Resize the image
  img <- image_resize(img, size)
  
  # Convert and save as WebP
  image_write(img, path = image_path)
}


# Convert images from PNG to Webp ----------

## List all PNG files in the folder
png_files <- list.files(
  path = "assets/images/",
  pattern = "\\.png$",
  full.names = TRUE
)

# Use purrr::map function to apply the conversion function to each PNG file
map(png_files, convert_to_webp)

# Remove old .png files
# map(png_files, file_delete)


# Resize Image(s) ----------
# resize_image(here("assets/images/INSERT_FILE.webp"), 400)