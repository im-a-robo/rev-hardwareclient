$ErrorActionPreference = 'Stop'; # stop on all errors

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url         = 'https://github.com/REVrobotics/REV-Software-Binaries/releases/download/rhc-1.4.1/REV-Hardware-Client-Setup-1.4.1.exe'
$fileName    = 'REV-Hardware-Client-Setup-1.4.1.exe'
$checksum = '97da2fb93a444ebe89d32f8430b49b64b593de7b78e768252f59de3a71f4ec32'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'REV Hardware Client*'
  fileType       = 'EXE'
  Url            = $url
  file           = $fileName
  checksum       = $checksum
  checksumType   = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0, 1223) # 1223 because there is a bug with the installer and /S right now
}

Install-ChocolateyPackage  @packageArgs #https://docs.chocolatey.org/en-us/guides/create/mount-an-iso-in-chocolatey-package