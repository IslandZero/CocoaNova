class Nova::Loader::TXT < Nova::Loader
  extension :txt

  def load(content)
    content.split("\n").delete_if do |val|
      val == nil || val == ""
    end
  end
end
