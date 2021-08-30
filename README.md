# TemHelmCharts

This repository is full functional helm repository. Take a look at repository.

Repository folder structure:

    ├── charts                                # Charts folders
    │   ├── celery                            # A chart for celery
    │   │   ├── Chart.yaml                    # Chart metadata(name, version)
    │   │   ├── templates                     # Helm Stuff
    │   │   └── values.yaml
    │   └── django                            # A chart for django
    │       ├── Chart.yaml
    │       ├── templates                     # Helm Stuff
    │       └── values.yaml
    ├── releases                              # Folder with released charts version
    │   ├── celery
    │   │   └── celery-helm-chart-v0.0.1.tgz
    │   └── django
    │       └── django-helm-chart-v0.0.1.tgz
    ├── _config.yml
    ├── index.yaml                            # Turn this project a helm repository
    ├── README.md
    ├── release_charts.sh                     # Release new chart versions
    └── test_charts.sh                        # Test current chart version


Add this repository:

    helm repo add temhelmcharts  https://tembici.github.io/temhelmcharts/

Use this repository:

    helm template temhelmcharts/django-helm-chart --version 0.0.1


Test charts:

    ./test_charts.sh

Release new chart:

    ./release_charts.sh