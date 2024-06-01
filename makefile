.PHONY: update
update: 
	home-manager switch --flake .#bowlbird 
	
.PHONY: clean
clean: 
	nix-collect-garbage -d