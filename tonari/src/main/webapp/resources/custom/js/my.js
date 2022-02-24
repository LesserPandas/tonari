
	


	
	//summernote jquery
			
			$(function(){
				$('#summernote').summernote({
				height:300,
				fontNames : [ '맑은고딕', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', ],
				fontNamesIgnoreCheck : [ '맑은고딕' ],
				focus: true,
				
				callbacks: {
				onImageUpload: function(files, editor, welEditable) {
				            for (var i = files.length - 1; i >= 0; i--) {
				             sendFile(files[i], this);
				            }
				        }
				}
				
				});
				
				})
				
				function sendFile(file, el) {
					var form_data = new FormData();
				       form_data.append('file', file);
				       $.ajax({
				         data: form_data,
				         type: "POST",
				         url: 'productImage.do',
				         cache: false,
				         contentType: false,
				         enctype: 'multipart/form-data',
				         processData: false,
				         success: function(img_name) {
				        	 //alert(img_name);
				           $(el).summernote('editor.insertImage', img_name);
				         }
				       });
				    }
	
	
	
