require 'tiramisu/project/filePreviewer'

describe 'Tiramisu.Project.FilePreviewer', ->

  it 'testing brah', ->
    abc = new Tiramisu.Project.FilePreviewer
      placeholderImage: null
      fileInput: null
      reader: null
    expect(abc.test()).toBe(5)
