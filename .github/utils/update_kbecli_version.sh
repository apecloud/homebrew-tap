#!/usr/bin/env bash
VERSION=$1

if [[ -z "$VERSION" ]]; then
    echo "release version is empty"
    exit 1
fi

VERSION="${VERSION/v/}"

formula_file="./Formula/kbecli.rb"
OS=$(echo $(uname) | tr '[:upper:]' '[:lower:]')

update_file() {
    case $OS in
        darwin)
            sed -i '' "s/$1/$2/g" $3
        ;;
        *)
            sed -i "s/$1/$2/g" $3
        ;;
    esac
}

update_file_with_line_num() {
    case $OS in
        darwin)
            sed -i '' "$4s/$1/$2/g" $3
        ;;
        *)
            sed -i "$4s/$1/$2/g" $3
        ;;
    esac
}

update_formula_version() {
    # get formula kbecli.rb version
    formula_version=$( cat $formula_file | grep version | awk 'NR==1{print $2}' | sed 's/\"//g' )
    # update formula kbecli.rb version
    echo "update formula_version:"$formula_version" to release_version:"$VERSION
    update_file $formula_version $VERSION $formula_file
    url_sha256=""
    line_num=0
    while read -r readline; do
        line_num=$(( line_num + 1 ))
        if [[ "$readline" == *"url"* ]];then
            url=$( echo "$readline" | awk '{print $2}' | sed 's/\"//g' )
            echo "get $url sha256..."
            url_sha256=$( curl -sL $url | shasum -a 256 | cut -d " " -f 1 )
        elif [[ "$readline" == *"sha256"* ]];then
            sha256=$( echo "$readline" | awk '{print $2}' | sed 's/\"//g' )
            echo "update sha256:"$sha256" to url_sha256:"$url_sha256
            update_file_with_line_num $sha256 $url_sha256 $formula_file $line_num
            url_sha256=""
        fi
    done < $formula_file
}

update_formula_version

if [[ "$VERSION" == *.*.* && "$VERSION" != *.*.*-* ]]; then
    formula_version_file=${formula_file/.rb/@$VERSION.rb}
    if [[ ! -f $formula_version_file ]]; then
        cp -r $formula_file $formula_version_file
        git add $formula_version_file
        update_file "class Kbecli < Formula" "class KbecliAT${VERSION//./} < Formula" $formula_version_file
    fi
fi

