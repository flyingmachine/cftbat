include Nanoc::Helpers::Rendering

CHAPTER_IDS_ORDERED = %w{
  introduction
  getting-started
  basic-emacs
  do-things
  core-functions-in-depth
  functional-programming
  organization
  read-and-eval
  writing-macros
  concurrency
  core-async
  java
  multimethods-records-protocols
  upcoming
  resources
  debugging
  about
}

def chapter_order(item)
  CHAPTER_IDS_ORDERED.index(item.identifier.gsub("/", ""))
end

def chapters
  @chapters ||= @items.select{|i| i[:kind] == 'documentation' && !i[:draft]}.sort{ |a, b|
    chapter_order(a) <=> chapter_order(b)
  }
end
