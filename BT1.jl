### A Pluto.jl notebook ###
# v0.19.9

using Markdown
using InteractiveUtils

# ╔═╡ 30680a2c-4cae-4283-a9c1-3d1b2c12efb5
md"""

$p(y=k|x) \propto p(x|y=k) * p(y=k)$
$p([x_1, x_2, x_3, x_4] | y = k) * θ_k$
$\prod_{j=1}^D p(x_j | y = k) * θ_k$
$\prod_{j=1}^D p(x_j = 1 | y = k) * θ_k$
$\left [\prod_{j=1}^D \theta_{jk} \right] * θ_k$
$\theta_{jk} = \frac{p(x_j=1, y=k)}{p(y=k)} = \frac{c(x_j=1, y=k)}{c(y=k)}$
posterior distribution $\propto$ [likelyhood distribution] * [prior distribution]
"""

# ╔═╡ 30f5004f-6c93-414b-88a3-a1e1347efd9b
y = [1; 1; 2; 2; 2; 1; 2; 1]

# ╔═╡ f97af7da-b203-4a4a-804c-858064eace4d
# p(y=1) = ? p(y=2) = ?

# ╔═╡ df719fed-6141-455f-8b9a-2b1342a5ebb3
θ = zeros(2)

# ╔═╡ 03eb5e83-4667-4d83-b25a-6d1124191522
N = length(y)

# ╔═╡ 809fe39e-fc07-40bc-b84b-217abea2e560
y .== 1

# ╔═╡ 1396dbb4-8f39-4f82-a4b5-e33258090a72
θ[1] = sum(y .== 1)/N

# ╔═╡ 7688226f-10da-4826-8837-8d13d7266152
θ[1] = sum(y .== 2)/N

# ╔═╡ 0bac8c5d-d558-4a22-8565-25b0fc18007d
X = [1 1 1 0;
        1 1 1 1;
        0 1 1 0;
        0 0 1 1;
        0 0 0 0;
        0 0 0 1;
        1 0 0 0;
        0 1 1 1;
]

# ╔═╡ eaff6f28-04ea-4e9f-bbcb-c648923e07cb
id1 = (y .== 1)

# ╔═╡ efc96405-7049-4315-adac-012319e2be83
X1 = X[id1, :]

# ╔═╡ b6a092dd-fa29-4c62-bc95-43e5bc124aac
sum(X1, dims=1)

# ╔═╡ 9f1505fc-b8e2-4726-8f65-e458376ac440
id2 = (y .== 2)

# ╔═╡ a1b04b10-34ea-41fe-87d4-9cd516c3168f
X2 = X[id2, :]

# ╔═╡ 4aa86bd5-fd2c-4db2-9417-b927e49e83f7
sum(X2, dims=1)

# ╔═╡ 35806a3f-65fb-4fc5-9dc6-1746fb2d75c9
y

# ╔═╡ 5c8acab6-1be1-4832-8751-a93ef201247d
unique(y)

# ╔═╡ c295a844-34d8-48e9-99f8-043f12b4b09b
size(X)

# ╔═╡ 402d971b-3c19-467d-b850-12bfbf401e9c
function train(X, y) # train/fit/estimate
	K = length(unique(y)) # number of labels
	N, D = size(X) # number of samples and domain dimensions
	θ_k = zeros(K)
	θ_jk = zeros(D, K)
	for k = 1:K
		idk = (y .== k)
		θ_k[k] = sum(idk)
		Xk = X[idk, :]
		θ_jk[:, k] = sum(Xk, dims = 1) ./ θ_k[k]
	end
	θ_k = θ_k ./ N
	return θ_k, θ_jk
end

# ╔═╡ a1de18dc-8f76-4801-81b7-7a474bc873af
θ_k, θ_jk = train(X, y)

# ╔═╡ 737e4f58-8295-4898-a88e-c2d6b4d84179
function classify(θ_k, θ_jk, xNew)
	D, K = size(θ_jk)
	p = zeros(K) # log posterior distribution
	for k=1:K
		s = 0
		for j=1:D
			s = s + if (xNew[j] == 1) log(θ_jk[j, k]) else log(1 - θ_jk[j, k]) end
		end
		p[k] = log(θ[k]) + s
	end
	return argmax(p)
end

# ╔═╡ b29b4c12-6258-4bf1-8e46-3d8285ef6468
xNew = [1; 0; 1; 0]

# ╔═╡ 6667f485-3eaa-43bb-8e64-ac5523217c76
yNew = classify(θ_k, θ_jk, xNew)

# ╔═╡ ffdea48c-21f5-4bd8-a4f4-38e60c341e1c
md"""
posterior distribution = $p(y=k|x) \propto \left [\prod_{j=1}^D \theta_{jk} \right] * θ_k$

$\log p(y=k|x) \propto \left [\sum_{j=1}^D \log \theta_{jk} \right] + \log θ_k$
"""

# ╔═╡ d32eaff1-3b24-447a-9b33-06bc9850dbed
v = rand(10)

# ╔═╡ 55e9a552-17a3-4579-993b-25e7e3baa49c
u = rand(10)

# ╔═╡ 704c1b14-f2b8-443d-b5d5-686f377c6122
u + v

# ╔═╡ 876032ad-af8a-462e-87c1-81e497d44d5a
begin
	s =  zeros(10)
	for j=1:length(u)
		s[j] = u[j] + v[j]
	end
	s
end

# ╔═╡ 72ede5af-2f85-4a44-a5b8-5f09bc7c6bb4
function predict(x⃗, θ_k, θ_jk)
	K = size(θ_jk)[2]
	θ_jk2 = deepcopy(θ_jk)
	θ_jk2[(x⃗ .== 1), :] = log.(θ_jk2[(x⃗ .== 1), :])
	θ_jk2[(x⃗ .== 0), :] = log.(1 .- θ_jk2[(x⃗ .== 0), :])
	v⃗ = sum.(eachcol(θ_jk2)) .+ log.(θ_k)
	return argmax(v⃗)
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.5"
manifest_format = "2.0"
project_hash = "da39a3ee5e6b4b0d3255bfef95601890afd80709"

[deps]
"""

# ╔═╡ Cell order:
# ╠═30680a2c-4cae-4283-a9c1-3d1b2c12efb5
# ╠═30f5004f-6c93-414b-88a3-a1e1347efd9b
# ╠═f97af7da-b203-4a4a-804c-858064eace4d
# ╠═df719fed-6141-455f-8b9a-2b1342a5ebb3
# ╠═03eb5e83-4667-4d83-b25a-6d1124191522
# ╠═809fe39e-fc07-40bc-b84b-217abea2e560
# ╠═1396dbb4-8f39-4f82-a4b5-e33258090a72
# ╠═7688226f-10da-4826-8837-8d13d7266152
# ╠═0bac8c5d-d558-4a22-8565-25b0fc18007d
# ╠═eaff6f28-04ea-4e9f-bbcb-c648923e07cb
# ╠═efc96405-7049-4315-adac-012319e2be83
# ╠═b6a092dd-fa29-4c62-bc95-43e5bc124aac
# ╠═9f1505fc-b8e2-4726-8f65-e458376ac440
# ╠═a1b04b10-34ea-41fe-87d4-9cd516c3168f
# ╠═4aa86bd5-fd2c-4db2-9417-b927e49e83f7
# ╠═35806a3f-65fb-4fc5-9dc6-1746fb2d75c9
# ╠═5c8acab6-1be1-4832-8751-a93ef201247d
# ╠═c295a844-34d8-48e9-99f8-043f12b4b09b
# ╠═402d971b-3c19-467d-b850-12bfbf401e9c
# ╠═a1de18dc-8f76-4801-81b7-7a474bc873af
# ╠═737e4f58-8295-4898-a88e-c2d6b4d84179
# ╠═b29b4c12-6258-4bf1-8e46-3d8285ef6468
# ╠═6667f485-3eaa-43bb-8e64-ac5523217c76
# ╠═ffdea48c-21f5-4bd8-a4f4-38e60c341e1c
# ╠═d32eaff1-3b24-447a-9b33-06bc9850dbed
# ╠═55e9a552-17a3-4579-993b-25e7e3baa49c
# ╠═704c1b14-f2b8-443d-b5d5-686f377c6122
# ╠═876032ad-af8a-462e-87c1-81e497d44d5a
# ╠═72ede5af-2f85-4a44-a5b8-5f09bc7c6bb4
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
