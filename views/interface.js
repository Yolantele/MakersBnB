$(document).ready(function () {

  function updatePropertyList () {
  $('#property').text(property.name)
  $.post('http://localhost:9292/property/new', { name: property.name })
  }

  $('#post').on('click', function () {
    property.last()
    updatePropertyList()
  })
}
