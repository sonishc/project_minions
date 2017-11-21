$(document).on('mousedown', '#deleteBtn', function(event){
  var modal = document.getElementById('deleteModal');
  var btn = document.getElementById('deleteBtn');

  var span = document.getElementsByClassName('close-delete')[0];

  btn.onclick = function() {
      modal.style.display = 'block';
  }

  span.onclick = function() {
      modal.style.display = 'none';
  }

  window.onclick = function(event) {
      if (event.target == modal) {
          modal.style.display = 'none';
      }
  }
});