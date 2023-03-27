#!/usr/bin/env bash
VERSION=$1

if [[ -z "$VERSION" ]]; then
    echo "release version is empty"
    exit 1
fi

VERSION="${VERSION/v/}"

formula_file="./Formula/kbcli.rb"
OS=$(echo $(uname) | tr '[:upper:]' '[:lower:]')

update_file() {
    case $OS in
        darwin)
            sed -i '' "s/$1/$2/g" $formula_file
        ;;
        *)
            sed -i "s/$1/$2/g" $formula_file
        ;;
    esac
}

update_formula_version() {
    # get formula kbcli.rb version
    formula_version=$( cat $formula_file | grep version | awk 'NR==1{print $2}' | sed 's/\"//g' )
    # update formula kbcli.rb version
    echo "update formula_version:"$formula_version" to release_version:"$VERSION
    update_file $formula_version $VERSION
    url_sha256=""
    while read -r readline; do
        if [[ "$readline" == *"url"* ]];then
            url=$( echo "$readline" | awk '{print $2}' | sed 's/\"//g' )
            echo "get $url sha256..."
            url_sha256=$( curl -sL $url | shasum -a 256 | cut -d " " -f 1 )
        elif [[ "$readline" == *"sha256"* ]];then
            sha256=$( echo "$readline" | awk '{print $2}' | sed 's/\"//g' )
            echo "update sha256:"$sha256" to url_sha256:"$url_sha256
            update_file $sha256 $url_sha256
        fi
    done < $formula_file
}

update_formula_version
