# macos-provisioner

Run to install third-party dependencies:

```shell
ansible-galaxy install -r requirements.yaml
```

Create **hosts.yaml** file based on **hosts-example.yaml**

Create **config.yaml** file and override configs from **default.config.yaml**

Run ansible playbook:

```shell
ansible-playbook main.yaml
```
