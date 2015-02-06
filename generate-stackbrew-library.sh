#!/bin/bash
set -e

declare -A aliases
aliases=(
)
defaultVersion='9'
defaultJava='7'
defaultSuffix="jre${defaultJava}"

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

versions=( */ )
versions=( "${versions[@]%/}" )
url='git://github.com/docker-library/jetty'

echo '# maintainer: InfoSiftr <github@infosiftr.com> (@infosiftr)'
echo '# maintainer: Mike Dillon <mike@embody.org> (@md5)'

for version in "${versions[@]}"; do
	commit="$(git log -1 --format='format:%H' -- "$version")"

	majorVersion="${version%%-*}"
	suffix="${version#*-}" # "jre7"

	fullVersion="$(grep -m1 'ENV JETTY_VERSION ' "$version/Dockerfile" | cut -d' ' -f3)"
	fullVersion="${fullVersion%.v*}"
	majorMinorVersion="${fullVersion%.*}"

	versionAliases=( $fullVersion-$suffix $majorMinorVersion-$suffix $majorVersion-$suffix ) # 8.0.14-jre7 8.0-jre7 8-jre7
	if [ "$majorVersion" = "$defaultVersion" ]; then
		versionAliases+=( $suffix ) # jre7
	fi

	if [ "$suffix" = "$defaultSuffix" ]; then
		versionAliases+=( $fullVersion $majorMinorVersion $majorVersion ) # 8.0.14 8.0 8
		if [ "$majorVersion" = "$defaultVersion" ]; then
			versionAliases+=( latest )
		fi
	fi

	versionAliases+=( ${aliases[$version]} )

	echo
	for va in "${versionAliases[@]}"; do
		echo "$va: ${url}@${commit} $version"
	done
done
