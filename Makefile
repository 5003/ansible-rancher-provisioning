PLAY = ansible-playbook ./playbooks/setup.yml $(PARAM)

install-ansible: PH
	wget --quiet --output-document - https://github.com/5003/get-pip-ansible/raw/master/install_ansible.sh | sh -s -- 2.1.4.0 && ansible --version

play: PH
ifneq (, $(findstring local, $(MAKECMDGOALS)))
	$(PLAY) --connection local
else
	$(PLAY)
endif

PH:
.PHONY: $(PH)