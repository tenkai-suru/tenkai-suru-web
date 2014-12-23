class Tiramisu.Project.FilePreviewer
  constructor: (@settings) ->
    # if document.contains @settings.placeholderImage
    #   @setup()

  setup: ->
    @bindEvents()
    @hideInput()

  test: ->
    5

  bindEvents: ->
    @settings.fileInput.addEventListener 'change', (event) =>
      @convertImage(event.currentTarget.files[0])

    @settings.reader.addEventListener 'load', (event) =>
      @setPlaceholderImage(event.currentTarget.result)

    @settings.placeholderImage.addEventListener 'dragover', (event) =>
      event.preventDefault() && event.stopPropagation()
      event.currentTarget.classList.add('hover')

    @settings.placeholderImage.addEventListener 'dragleave', (event) =>
      event.preventDefault() && event.stopPropagation()
      event.currentTarget.classList.remove('hover')

    @settings.placeholderImage.addEventListener 'drop', (event) =>
      event.preventDefault() && event.stopPropagation()
      event.currentTarget.classList.remove('hover')

      @convertImage(event.dataTransfer.files[0])

  convertImage: (file) ->
    @settings.reader.readAsDataURL(file)

  setPlaceholderImage: (dataURI) ->
    @settings.placeholderImage.setAttribute('src', dataURI)

  hideInput: ->
    @settings.fileInput.style.display = 'none'

# new FilePreviewer
#   placeholderImage: document.getElementById('project-icon-placeholder')
#   fileInput: document.getElementById('project-icon')
#   reader: new FileReader
