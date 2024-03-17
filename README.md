# Tattooist
Reservation system for tattoo artists. Currently showcasing only one key feature - artist machine learning recommendation.

Tattooist as an overall product is a reservation system for tattoo artists. Tattoo artists upload examples of their work. These photos are then used as training data for image classification model which serves as a recommendation system for customers. A user uploads a picture of their desired tattoo style from the Internet. Based on this photo, said classification model recommends suitable tattoo artists in the area.

Still in progress. Not publicly available in production yet.
- 

The current workflow is that the classification model is converted to a CoreML model which is meant to sit in cloud and be downloaded each time a user opens an app (providing a new version of the model is available). It is to be yet discussed whether sending API requests to a model in cloud would not be the more efficient way.

<table>
  <tr>
    <th>
      <img src="IMG_6076.PNG" width="300">
    </th>
    <th>
      <img src="IMG_6075.PNG" width="300">
    </th>
  </tr>
</table>
