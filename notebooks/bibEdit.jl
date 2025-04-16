
filePathIn = "abbreviated.bib"
filePathOut = "abbreviated2.bib"
 
f_in = open(filePathIn, "r")
f_out = open(filePathOut, "w")
 
for line in readlines(f_in)
    
    splitLine = split(line, "=")
    if lowercase(strip(splitLine[1])) == "author"
        # Convert long author lists to "et al.
        authors = split(splitLine[2], " and ")
        if length(authors) > 2
            newline = "$(rstrip(splitLine[1])) = $(authors[1]) and others},"
            write(f_out, newline)
            write(f_out, "\n")
        else 
            write(f_out, line)
            write(f_out, "\n")
        end
    elseif lowercase(strip(splitLine[1])) == "title"
        # Remove article title 
        # nothing
    else
        write(f_out, line)
        write(f_out, "\n")
    end 
end

close(f_in)
close(f_out)
println("Done")