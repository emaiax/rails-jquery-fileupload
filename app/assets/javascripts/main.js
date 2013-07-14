$(function () {
  var fileUploadErrors = {
    maxFileSize: 'File is too big',
    minFileSize: 'File is too small',
    acceptFileTypes: 'Filetype not allowed',
    maxNumberOfFiles: 'Max number of files exceeded',
    uploadedBytes: 'Uploaded bytes exceed file size',
    emptyResult: 'Empty file upload result'
  };

  // Initialize the jQuery File Upload widget:
  $('#fileupload').fileupload();
  // 
  // Load existing files:
  url = $('#fileupload').prop('action') + '?product_token=' + $('#fileupload').find('#picture_token').val();
  $.getJSON(url, function (files) {
    var fu = $('#fileupload').data('blueimpFileupload'), 
    template;
    fu._adjustMaxNumberOfFiles(-files.length);
    template = fu._renderDownload(files)
    .appendTo($('#fileupload .files'));
    // Force reflow:
    fu._reflow = fu._transition && template.length &&
      template[0].offsetWidth;
    template.addClass('in');
    $('#loading').remove();
  });
});
