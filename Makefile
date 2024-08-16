.PHONY: run-k8s
run-k8s:
	minikube start --driver=docker

.PHONY: pre-install
pre-install:
	helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts

.PHONY: install
install: pre-install
	helm install my-otel-demo open-telemetry/opentelemetry-demo

.PHONE: network
network:
	kubectl port-forward svc/my-otel-demo-frontendproxy 8080:8080
