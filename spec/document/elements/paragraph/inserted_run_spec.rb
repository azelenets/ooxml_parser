require 'spec_helper'

describe 'Inserted Run' do
  it 'inserted_run not empty' do
    docx = OoxmlParser::Parser.parse('spec/document/elements/paragraph/inserted/inserted_run.docx')
    expect(docx.elements.first.inserted.id).to eq(0)
    expect(docx.elements.first.inserted.author).to eq('Christopher Turk')
    expect(docx.elements.first.inserted.date).to eq(DateTime.parse('2017-01-27T07:45:24Z'))
    expect(docx.elements.first.inserted.user_id).to eq('17eaeb71-e813-4f01-8343-e1bf812d3074')
    expect(docx.elements.first.inserted.run.text).to eq('Simple Test Text')
  end
end
