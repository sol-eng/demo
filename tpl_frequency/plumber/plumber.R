library(pins)
library(recipes)

board_register("rsconnect", 
               server = "https://colorado.rstudio.com/rsc",
               key = Sys.getenv("CONNECT_API_KEY"))

# Retrieve Pin
predict_fn <- pin_get("kevin.kuo/predict_tpl_claim_count", board = "rsconnect")

#* @apiTitle Claim Frequency Prediction
#* @apiDescription Compute expected claim frequency given policy characteristics.

#* Compute expected claim count.
#* @param area Area code of insured vehicle; A-F.
#* @param vehicle_power Power of the car; 4-9, 10-15.
#* @param vehicle_age Vehicle age in years.
#* @param driver_age Age of insured driver.
#* @param vehicle_brand Anonymized categories for the brand of the vehicle; B1-B6, B10-B14.
#* @post /predict
function(area, vehicle_power, vehicle_age, driver_age, vehicle_brand) {
  newdata <- data.frame(
    area = area,
    vehicle_power = vehicle_power,
    vehicle_age = as.integer(vehicle_age),
    driver_age = as.integer(driver_age),
    vehicle_brand = vehicle_brand,
    exposure = 1,
    stringsAsFactors = FALSE
  )
  
  out <- predict_fn(newdata)
  out
}
