# Useful function for network information finding

function ipsort
    sort -t . -k 1,1n -k 2,2n -k 3,3n -k 4,4n
end

function strip_proto  --description "Remove the protocol and path from a URL"
    set output $argv[1]
    set output (string replace -r "(https?|ftp|ssh|rsync){0,1}://" "" $output)
    string replace -r "/.*" "" $output
end

function command_with_stripped_proto  --description "Run a command on a URL after stripping the protocol and path"
    set stripped (strip_proto $argv[2])

    command $argv[1] $stripped $argv[3..-1]
end

function host --description "Run host on a URL"
    command_with_stripped_proto host $argv[1] $argv[2..-1]
end

function dig --description "Run dig on a URL"
    command_with_stripped_proto dig $argv[1] $argv[2..-1]
end

function nslookup --description "Run nslookup on a URL"
    command_with_stripped_proto nslookup $argv[1] $argv[2..-1]
end

function ping --description "Run ping on a URL"
    command_with_stripped_proto ping $argv[1] $argv[2..-1]
end

function whois --description "Run whois on a URL"
    command_with_stripped_proto whois $argv[1] $argv[2..-1]
end

function ipwhois --description "Get IP whois data after resolving a URL"
    set host (strip_proto $argv[1])

    if string match -r "[0-9]{1,3}\.[0-9]{1,3}\." $host
        set ip $host
    else
        # Assuming this is a dns name
        set ip (dig +short $host)
    end

    if string length -q $str
        return 1
    end

    echo "IP whois for $ip"
    command whois $ip $argv[2..-1]
end


# Proxy curl to burp or mitmproxy
function pcurl --description "Run curl through a local proxy (port 8080)"
    http_proxy=127.0.0.1:8080 https_proxy=127.0.0.1:8080 curl -ik $argv
end

# View headers from a GET (not HEAD)
function headers --description "Get headers without making a HEAD request"
    curl -k -I -X GET $argv
end
