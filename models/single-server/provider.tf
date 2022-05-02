provider "google" {
  project     = "hoquocdat"
  region      = "asia-southeast1"
  credentials = file("~/.secret/vixy-rake.json")
}