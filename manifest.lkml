connection: "CONNECTION_NAME"

# Model file: google_analytics_forecast.model.lkml
explore: google_analytics_forecast {
  label: "Google Analytics Forecast"
  description: "Forecasted sessions using BigQuery ML ARIMA model"

  # Base view
  from: google_analytics_forecast

  # Dimensions
  dimension: forecast_date {
    type: date
    sql: ${TABLE}.forecast_timestamp ;;
    label: "Forecast Date"
  }

  dimension: forecast_value {
    type: number
    sql: ${TABLE}.forecast_value ;;
    label: "Forecasted Sessions"
  }

  dimension: confidence_interval_lower {
    type: number
    sql: ${TABLE}.confidence_interval_lower ;;
    label: "Lower Bound"
  }

  dimension: confidence_interval_upper {
    type: number
    sql: ${TABLE}.confidence_interval_upper ;;
    label: "Upper Bound"
  }

  # Measures
  measure: avg_forecast {
    type: average
    sql: ${forecast_value} ;;
    label: "Average Forecast"
  }

  measure: forecast_range {
    type: number
    sql: ${confidence_interval_upper} - ${confidence_interval_lower} ;;
    label: "Forecast Range"
  }
}
