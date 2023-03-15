# produces an output value named "space_heroes"
output "geo" {
  description = "API that documents pleace of ISS"
  value       = data.http.iss.response_body
}

# produces legal JSON output value named "space_heroes_json"
output "space_heroes_json" {
  description = "API that documents folks in space"
  value       = jsondecode(data.http.iss.response_body)    // note the jsondecode()
}    

