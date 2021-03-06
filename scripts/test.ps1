dotnet test --no-restore --no-build --test-adapter-path:. --logger:Appveyor /p:AltCover="true"

$commitID = & git rev-parse HEAD
$commitBranch = & git rev-parse --abbrev-ref HEAD

foreach ($coverage in ls -r coverage*.xml) {
  & csmacnz.coveralls --opencover -i $coverage --commitId $commitID --commitBranch $commitBranch
}
