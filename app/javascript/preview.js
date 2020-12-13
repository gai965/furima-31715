if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const html = (function () {
      const html = `<a href='/'>
                      <img src="/assets/furima-logo-color-9486ef715c62ec78e487e9fd713395dee60de0966916f621cbc19d0462dbf03b.png" width="185" height="50">
                    </a>`
      return html;
    }());

    document.getElementById('new_product').addEventListener('change', function(e){
      const imageContent = document.querySelector('img');
      if (imageContent){
        imageContent.remove();
      }
      const HeaderIcon = document.getElementsByClassName('items-sell-header')
      HeaderIcon[0].insertAdjacentHTML('afterbegin', html);
      const ImagePreview = document.getElementById('image_preview');

      const file = e.target.files[0]
      const blob = window.URL.createObjectURL(file);
      const imageElement = document.createElement('div');
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute("width", "300px");
      blobImage.setAttribute("height", "300px");

      imageElement.appendChild(blobImage);
      ImagePreview.appendChild(imageElement);
    });
  });
}