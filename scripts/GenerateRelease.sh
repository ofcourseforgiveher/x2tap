#!/usr/bin/env bash
rm -rf release && mkdir release
cd release

mkdir -p x64/driver
mkdir -p x86/driver

mkdir -p x64/mode
mkdir -p x86/mode

echo "------------------------------------------------------------"
echo "Copying x64"
echo "------------------------------------------------------------"
cp ../../x2tap/bin/x64/Release/*.dll x64
cp ../../x2tap/bin/x64/Release/x2tap.exe x64
cp ../../binaries/prebuilt/x64/OemVista.inf x64/driver
cp ../../binaries/prebuilt/x64/tap0901.cat x64/driver
cp ../../binaries/prebuilt/x64/tap0901.sys x64/driver
cp ../../binaries/prebuilt/x64/*.exe x64
cp ../../binaries/prebuilt/x64/*.dll x64
cp ../../binaries/prebuilt/x64/*.lib x64
cp ../../binaries/prebuilt/geoip.dat x64
cp ../../binaries/prebuilt/geosite.dat x64
cp ../../binaries/prebuilt/RunHiddenConsole.exe x64
cp ../../binaries/prebuilt/dnscrypt-proxy.toml x64
cp ../../binaries/prebuilt/dnscrypt-forwarding-rules.txt x64
echo "------------------------------------------------------------"
echo "Copying x86"
echo "------------------------------------------------------------"
cp ../../x2tap/bin/x86/Release/*.dll x86
cp ../../x2tap/bin/x86/Release/x2tap.exe x86
cp ../../binaries/prebuilt/x64/OemVista.inf x86/driver
cp ../../binaries/prebuilt/x64/tap0901.cat x86/driver
cp ../../binaries/prebuilt/x64/tap0901.sys x86/driver
cp ../../binaries/prebuilt/x86/*.exe x86
cp ../../binaries/prebuilt/x86/*.dll x86
cp ../../binaries/prebuilt/x86/*.lib x86
cp ../../binaries/prebuilt/geoip.dat x86
cp ../../binaries/prebuilt/geosite.dat x86
cp ../../binaries/prebuilt/RunHiddenConsole.exe x86
cp ../../binaries/prebuilt/dnscrypt-proxy.toml x86
cp ../../binaries/prebuilt/dnscrypt-forwarding-rules.txt x86
echo "------------------------------------------------------------"
echo "Copying modes"
echo "------------------------------------------------------------"
cp ../../modes/*.txt x64/mode
cp ../../modes/*.txt x86/mode
echo "------------------------------------------------------------"
echo "Compressing x64"
echo "------------------------------------------------------------"
cd x64
bc c -r -fmt:7z -l:9 x2tap.x64.7z *
echo "------------------------------------------------------------"
echo "Compressing x86"
echo "------------------------------------------------------------"
cd ../x86
bc c -r -fmt:7z -l:9 x2tap.x86.7z *
echo "------------------------------------------------------------"
echo "Generating release markdown"
echo "------------------------------------------------------------"
cd ../../
python GenerateReleaseMarkdown.py
echo "------------------------------------------------------------"