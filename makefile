.PHONY: all $(MAKECMDGOALS)
.DEFAULT_GOAL=dev
dev: deps 
	cargo run

deps: installs
	@rustc --version | grep -E 'nightly.*2020-09-25' $s || rustup override set $v
installs:
	@rustc --version $s || rustup --version $s || curl https://sh.rustup.rs -sSf | sh -s -- -y; export PATH="/root/.cargo/bin:$${PATH}"
s = &>/dev/null
v = nightly-2020-09-26