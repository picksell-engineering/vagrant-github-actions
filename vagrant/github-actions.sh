GH_RUNNER_VERSION="2.308.0"
GH_RUNNER_TOKEN=$1
GH_RUNNER_LABELS=$2

set -e
export DEBIAN_FRONTEND=noninteractive

sudo usermod -aG docker $USER

mkdir -p actions-runner && cd actions-runner

wget -q https://github.com/actions/runner/releases/download/v$GH_RUNNER_VERSION/actions-runner-linux-x64-$GH_RUNNER_VERSION.tar.gz

tar xzf ./actions-runner-linux-x64-$GH_RUNNER_VERSION.tar.gz
rm -f ./actions-runner-linux-x64-$GH_RUNNER_VERSION.tar.gz

mkdir -p _work

./config.sh --url https://github.com/picksell-engineering --token $GH_RUNNER_TOKEN --labels $GH_RUNNER_LABELS --replace --unattended

sudo ./svc.sh install
sudo ./svc.sh start
