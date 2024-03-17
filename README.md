# Tattooist
<i>Still in progress. Not publicly available in production yet.</i><br /><br />
Reservation system for tattoo artists. Currently showcasing only one key feature - artist recommendation via machine learning.

Tattooist as an overall product is a reservation system for tattoo artists. Tattoo artists upload examples of their work. These photos are then used as training data for image classification model which serves as a recommendation system for customers. A user uploads a picture of their desired tattoo style from the Internet. Based on this photo, said classification model recommends suitable tattoo artists in the area.

<b>Steps needed for the fully functioning product:</b>
<ul>
  <li>Artist uploads images to AWS S3 Data Storage [tested, not deployed] 🚧</li>
  <li>Images from S3 are used to train model on AWS [tested, not deployed] 🚧</li>
  <li>Trained model is convertable to a CoreML model compatible with iOS apps [done] ✅</li>
  <li>Trained model is accuratelly recommending tattoo artists based on their artwork style [done] ✅</li>
  <li>CoreML model sitting in the cloud is downloaded every time a user opens an app (provided there's a newer version) [haven't begun] ❌</li>
  <li>Automate the entire process [haven't begun] ❌</li>
  <li>Watch for retrainability and scalability [haven't begun] ❌</li>
  <li>iOS frontend [haven't begun] ❌</li>
</ul>

<table>
  <tr>
    <td>
      <img src="ImgExamples/IMG_6076.PNG" width="300">
    </td>
    <td>
      <img src="ImgExamples/IMG_6075.PNG" width="300">
    </td>
    <td>
      <img src="ImgExamples/IMG_6077.PNG" width="300">
    </td>
  </tr>
  <tr>
    <td colspan="3">
      <i>Prototype version (ignore the UI).</i> Example of three tattoo styles. For each, three artists are recommended.
    </td>
  </tr>
</table>

The current workflow is that the classification model is converted to a CoreML model which is meant to sit in cloud and be downloaded each time a user opens an app (providing a new version of the model is available). It is to be yet discussed whether sending API requests to a model in cloud would not be the more efficient way.

