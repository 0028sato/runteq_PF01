window.previewFileWithId = function(id) {
    const target = this.event.target;
    const file = target.files[0];
    const reader  = new FileReader();
    reader.onloadend = function () {
    preview.src = reader.result;
    }
    if (file) {
      reader.readAsDataURL(file);
    } else {
      preview.src = '';
   }
  }
  