module FileIO

  def file_read(filename)
    handle = File.open(filename, "r")
    message = handle.read
    handle. close
    message
  end

  def file_write(filename, write_string)
    writer = File.open(filename, "w")
    writer.write(write_string)
    writer.close
  end

end
