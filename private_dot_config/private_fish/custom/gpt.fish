function get_openai_key 
    echo (op read 'op://Personal/OpenAI/credential')
end
function ask_gpt -a prompt
    set -l payload (echo $prompt | jq --slurp -c -R '{ "model": "gpt-3.5-turbo", "messages": [{"role": "user", "content": (.)}], "temperature": 0.7 }')
    set OPENAI_API_KEY (get_openai_key)
    set -l gpt (curl https://api.openai.com/v1/chat/completions -s \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $OPENAI_API_KEY" \
    -d $payload)
    echo $gpt | jq -r '.choices[0].message.content'
end

function img_gpt -a prompt
    set json (echo $prompt | jq -R '.')
    set OPENAI_API_KEY (op read 'op://Personal/OpenAI/credential')
    set create_img (curl https://api.openai.com/v1/images/generations -s \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $OPENAI_API_KEY" \
    -d '{
        "prompt": $prompt,
        "n": 1,
        "size": "1024x1024"
    }')
    set url (echo $json | jq -r '.data[0].url')
    set rand_num (random 1 1000000)
    curl -s $url -o img-"$rand_num".png
end
