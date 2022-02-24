#!/bin/bash

export WORKDIR=/home/ubuntu
export KUBECONFIG_PATH=${WORKDIR}/.kube/config
export KUBE_TEST_REPO_LIST=${WORKDIR}/repo_list
export GO111MODULE=on
export GOPATH=/usr/local/bin/go
export GOROOT=/usr/local/go
export GOCACHE=${WORKDIR}/.cache/go-build
export PATH=$GOROOT/bin:$PATH
export KUBECONFIG=$KUBECONFIG_PATH
export E2ETEST_PATH=${WORKDIR}/kubernetes/_output/bin/e2e.test
export WINDOWS_CONFORMANCE_FOCUS="\[sig-network\].+\[Conformance\]|\[sig-windows\]"
export WINDOWS_CONFORMANCE_SKIP="\[LinuxOnly\]|\[Slow\]|\[Serial\]|\[Disruptive\]|\[Flaky\]|\[Feature:.+\]|\[sig-cli\]|\[sig-storage\]|\[sig-auth\]|\[sig-api-machinery\]|\[sig-apps\]|\[sig-node\]|\[Privileged\]|should be able to change the type from|\[sig-network\] Services should be able to create a functioning NodePort service \[Conformance\]|Service endpoints latency should not be very high|Device Plugin should be able to create a functioning device plugin for Windows"
export WINDOWS_NETWORKPOLICY_FOCUS="\[Feature:NetworkPolicy\]"
export WINDOWS_NETWORKPOLICY_SKIP="SCTP"
# ginkgo --noColor $E2ETEST_PATH -- --provider=skeleton --node-os-distro=windows --ginkgo.focus="$WINDOWS_CONFORMANCE_FOCUS" --ginkgo.skip="$WINDOWS_CONFORMANCE_SKIP" > windows_conformance_result_encap_118.txt
ginkgo -p -nodes 8 --seed=1592804472 --noColor $E2ETEST_PATH -- --provider=skeleton --ginkgo.focus="$WINDOWS_NETWORKPOLICY_FOCUS" --ginkgo.skip="$WINDOWS_NETWORKPOLICY_SKIP" > windows_networkpolicy_result_encap_118.txt
