#$number = 12;
gci * -Include *.aspx,*.master,*.html,*.htm -recurse | %{ 
    $content = [System.IO.File]::ReadAllText($_);
    $content = [regex]::replace($content,'\?v=(\d+)', { '?v=' + ([int]::Parse($args[0].Groups[1].Value)+1) })
    #$content = [regex]::replace($content,'\?v=(\d+)', { '?v=' + $number })
    [System.IO.File]::WriteAllText($_, $content);
}