PublishDraft = require "../lib/publish-draft"

describe "PublishDraft", ->
  beforeEach ->
    waitsForPromise -> atom.workspace.open("empty.markdown")

  it 'performs publish draft', ->
    publishDraft = new PublishDraft({})

    publishDraft.editor.save = -> {} # Double editor.save()
    publishDraft.moveDraft = -> {} # Double moveDraft()

    publishDraft.display()

    expect(publishDraft.draftPath).toMatch("fixtures/empty.markdown")
    expect(publishDraft.postPath).toMatch(/\/\d{4}\/\d{4}-\d\d-\d\d-empty\.markdown/)
