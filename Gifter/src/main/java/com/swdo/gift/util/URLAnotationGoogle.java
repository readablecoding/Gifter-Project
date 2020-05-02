package com.swdo.gift.util;

import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.AsyncBatchAnnotateImagesRequest;
import com.google.cloud.vision.v1.AsyncBatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.GcsDestination;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.cloud.vision.v1.ImageSource;
import com.google.cloud.vision.v1.LocationInfo;
import com.google.cloud.vision.v1.OutputConfig;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class URLAnotationGoogle {

	public static void AsyncBatchAnnotateImages(ArrayList<String> imgURL) throws IOException {
		List<AnnotateImageRequest> requests = new ArrayList<AnnotateImageRequest>();
		//ArrayList<AnnotateImageRequest> requestList = new ArrayList<AnnotateImageRequest>();
	      try (ImageAnnotatorClient imageAnnotatorClient = ImageAnnotatorClient.create()) {
	        String inputImageUri = "gs://cloud-samples-data/vision/label/wakeupcat.jpg";
	        String outputUri = "gs://gifter_bucketstorage/start1.json/";
	    	for(int i = 0; i < 4; i++) {
	    		ImageSource source = ImageSource.newBuilder().setImageUri(imgURL.get(i)).build();
	    		System.out.println(imgURL.get(i));
	    		//ImageSource source = ImageSource.newBuilder().setImageUri(inputImageUri).build();
		        Image image = Image.newBuilder().setSource(source).build();
		        Feature.Type type = Feature.Type.LABEL_DETECTION;
		        Feature featuresElement = Feature.newBuilder().setType(type).build();
		        AnnotateImageRequest requestsElement =
		        AnnotateImageRequest.newBuilder().setImage(image).addFeatures(featuresElement).build();
		        requests.add(requestsElement);
	    		}
	    	System.out.println(requests.size());
	    	
	    	BatchAnnotateImagesResponse response = imageAnnotatorClient.batchAnnotateImages(requests);
    		List<AnnotateImageResponse> responses = response.getResponsesList();
    		
    		for(AnnotateImageResponse res : responses) {
    			if(res.hasError()) {
    				System.err.printf("Error: %s\n",res.getError().getMessage());
    				return;
    			}
    			for(EntityAnnotation annotation : res.getLabelAnnotationsList()) {
    				//LocationInfo info = annotation.getLocationsList().listIterator().next();
    				//System.out.printf("LabelAnnotaton: %s\n %s\n",annotation.getDescription(),info.getLatLng());
//    				annotation.getAllFields().forEach((k, v) ->
//                    System.out.printf("%s : %s\n", k, v.toString()));
    				
    				System.out.println(annotation.getDescription());    				
    			}
    			
    			
    		}

//	        GcsDestination gcsDestination = GcsDestination.newBuilder().setUri(outputUri).build();
//
//	        // The max number of responses to output in each JSON file
//	        int batchSize = 50;
//	        OutputConfig outputConfig =
//	            OutputConfig.newBuilder()
//	                .setGcsDestination(gcsDestination)
//	                .setBatchSize(batchSize)
//	                .build();
//	        AsyncBatchAnnotateImagesRequest request =
//	            AsyncBatchAnnotateImagesRequest.newBuilder()
//	                .addAllRequests(requests)
//	                .setOutputConfig(outputConfig)
//	                .build();
//	        AsyncBatchAnnotateImagesResponse response =
//	            imageAnnotatorClient.asyncBatchAnnotateImagesAsync(request).get();
//	        // The output is written to GCS with the provided output_uri as prefix
//	        String gcsOutputUri = response.getOutputConfig().getGcsDestination().getUri();
//	        System.out.printf("Output written to GCS with prefix: %s\n", gcsOutputUri);
//	      } catch (Exception exception) {
//	        System.err.println("Failed to create the client due to: " + exception);
	      }
	    }

	
}
