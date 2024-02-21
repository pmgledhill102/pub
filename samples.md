# Sample Commands - Functions === Run

## Get Repo

```sh
git clone https://github.com/GoogleCloudPlatform/cloud-code-samples.git
cd cloud-code-samples/python/cloud-function-hello-world
```

## Functions (Gen 2)

Cloud Functions:

- Uses Cloud Build, and `pack`, to create a Container Image
- Copies image to GAR
- Create a Cloud Run Service using the image.

``` sh
gcloud functions deploy hello-fun \
--entry-point hello_get \
--runtime python312 \
--trigger-http \
--region europe-west2 \
--gen2 \
--allow-unauthenticated
```

## Cloud Run (from source)

Cloud Run:

- Uses Cloud Build, and `pack`, to create a Container Image
- Copies image to GAR
- Create a Cloud Run Service using the image.

``` sh
gcloud run deploy http-run-source --source . --region europe-west2 --allow-unauthenticated
```

## Cloud Build & Cloud Run

Cloud Build:

- Uses `pack`, to create a Container Image
- Copies image to GAR

Cloud Run

- Creates a Service using the image.

``` sh
export IMAGE=europe-west2-docker.pkg.dev/play-pen-pup/dev-images/cbd-run-image:latest
gcloud builds submit --pack image=${IMAGE} .
gcloud run deploy http-run-build-image --image ${IMAGE}  --region europe-west2 --allow-unauthenticated
```

## Local Pack, GAR & Cloud Run

Local

- Use pack to create a container image
- Push container image up to registry

Cloud Run

- Creates a Service using the image.

``` sh
export IMAGE=europe-west2-docker.pkg.dev/play-pen-pup/dev-images/pack-run-image:latest
pack build ${IMAGE} --path . --builder gcr.io/buildpacks/builder:v1
docker push ${IMAGE}
gcloud run deploy http-run-pack-image --image ${IMAGE}  --region europe-west2 --allow-unauthenticated
```
