### A Pluto.jl notebook ###
# v0.19.9

using Markdown
using InteractiveUtils

# ╔═╡ 2037a610-bcaf-11ed-3fea-4dd1f4bdac2f
using DelimitedFiles

# ╔═╡ 43123021-597c-4b45-a4b7-a71bda35d291
using Statistics

# ╔═╡ 819734ff-c7c0-4fb5-88e0-33bef9575b2a
irisPath = "C:/Users/BMC/Documents/julia/iris-train.txt"

# ╔═╡ 1fcdd173-2a40-4e5b-b5fe-6bf818acb770
A = readdlm(irisPath)

# ╔═╡ e935bb82-f28d-4ca5-bef6-32f854df193e
function readData(path :: String)
	A = readdlm(path)
	y = Int.(A[:, 1])
	X = A[:,2:end]
	(X, y)
end

# ╔═╡ 8dc0041d-38fc-42f4-8453-e29a2c6df24a
X, y = readData(irisPath)

# ╔═╡ ec1de340-e5a7-490b-bf91-dce342951740
function train(X, y)
	K = length(unique(y))
	N, D = size(X)
	μ = zeros(D, K)
	σ = zeros(D, K)
	θ = zeros(K) # prior θ[k] = P(y=k)
	for k=1:K
		idk = (y .== k)
		Xk = X[idk, :]
		μ[:, k] = mean(Xk, dims = 1)
		σ[:, k] = std(Xk, dims = 1)
		θ[k] = sum(idk)/N
	end
	(μ, σ, θ) # \mu, \sigma, \theta
end

# ╔═╡ 38fa97f2-8514-455f-8134-dc6d9286cef7
μ, σ, θ = train(X, y)

# ╔═╡ 28dbc1d6-ad45-4020-9dc2-264b4ac8ba90
md"""
$\log P(y = k|x) = \sum_{j=1}^D \log P(x_j|y=k) + \log P(y=k)$
$= \sum_{j=1}^D \left[ -\log(\sqrt{2\pi} - \log (\sigma_{jk}) - \frac{1}{2\sigma_{jk}^2}(x_j - \mu_{jk})^2 \right] + \log θ_k$
$\propto - \sum_{j=1}^D \left[ \log (\sigma_{jk}) + \frac{1}{2\sigma_{jk}^2}(x_j - \mu_{jk})^2 \right] + \log θ_k$
$\propto - \sum \left[ \log (\sigma_{\cdot k}) + \frac{1}{2\sigma_{\cdot k}^2}(x - \mu_{\cdot k})^2 \right] + \log θ_k$
"""

# ╔═╡ 0e1cd6b4-5ef6-4b86-b330-d63568a46c9c
function classify(μ, σ, θ, x)
	K = length(θ)
	p = zeros(K) # log posterior distribution
	for k = 1:K
		p[k] = -sum(log.(σ[:, k]) + (x - μ[:, k]).^2 ./ (2*σ[:, k].^2)) + log(θ[k])
	end
	argmax(p)
end

# ╔═╡ 14e1d0e2-9ab2-4689-94ff-9fe904896552
ŷ = [classify(μ, σ, θ, X[i,:]) for i = 1:length(y)]# y\hat

# ╔═╡ 47192066-a0af-4e3a-acc9-9e4d0fa4b6ad
z = map(i -> classify(μ, σ, θ, X[i,:]), 1:length(y))

# ╔═╡ 60da396b-78a4-49a1-9f77-3c17e243f7a1
z == ŷ

# ╔═╡ 133b848e-4c83-4fc8-ae4c-aadeb73d2fe9
sum(ŷ .== y)

# ╔═╡ 514359c9-6591-4c5f-8b5e-5946cc5573a1
sum(z .== y)

# ╔═╡ 6c2dc7c5-d76a-4ae5-9df3-a96e7416e7cb
training_accuracy = sum(ŷ .== y)/length(y)

# ╔═╡ a94697a5-1128-415c-88c6-603d6fbc148d
classify(μ, σ, θ, X[1,:])

# ╔═╡ 2a337901-6a33-4cc9-9c7d-4e9a3793f1aa
classify(μ, σ, θ, X[end,:])

# ╔═╡ 7e604d85-9f06-469d-b910-72b50c4d8ee1
u = rand(4)

# ╔═╡ 8f46b9a3-dbad-4bc5-98d7-21cee335e1aa
v = rand(4)

# ╔═╡ 1d3a0720-4638-4f7f-b60c-b93751a5336a
sum((u - v) .^ 2)

# ╔═╡ 687bec85-d95a-40bf-83da-3f83edeb7e4f
(u - v)'*(u - v)

# ╔═╡ 166f1b17-671a-4395-b8bd-dd17e6096f54
path = "C:/Users/BMC/Documents/julia/wdbc.txt"

# ╔═╡ 956d11a3-e226-4bf7-929b-f9ccf719719f
readdlm(path, ',')

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
DelimitedFiles = "8bb1440f-4735-579b-a4ab-409b98df4dab"
Statistics = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.5"
manifest_format = "2.0"
project_hash = "f8aed8cc7ec98e25caba5c40ea614d484439ba58"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.0.1+0"

[[deps.DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.20+0"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.1.1+0"
"""

# ╔═╡ Cell order:
# ╠═2037a610-bcaf-11ed-3fea-4dd1f4bdac2f
# ╠═819734ff-c7c0-4fb5-88e0-33bef9575b2a
# ╠═1fcdd173-2a40-4e5b-b5fe-6bf818acb770
# ╠═e935bb82-f28d-4ca5-bef6-32f854df193e
# ╠═8dc0041d-38fc-42f4-8453-e29a2c6df24a
# ╠═43123021-597c-4b45-a4b7-a71bda35d291
# ╠═ec1de340-e5a7-490b-bf91-dce342951740
# ╠═38fa97f2-8514-455f-8134-dc6d9286cef7
# ╠═28dbc1d6-ad45-4020-9dc2-264b4ac8ba90
# ╠═0e1cd6b4-5ef6-4b86-b330-d63568a46c9c
# ╠═14e1d0e2-9ab2-4689-94ff-9fe904896552
# ╠═47192066-a0af-4e3a-acc9-9e4d0fa4b6ad
# ╠═60da396b-78a4-49a1-9f77-3c17e243f7a1
# ╠═133b848e-4c83-4fc8-ae4c-aadeb73d2fe9
# ╠═514359c9-6591-4c5f-8b5e-5946cc5573a1
# ╠═6c2dc7c5-d76a-4ae5-9df3-a96e7416e7cb
# ╠═a94697a5-1128-415c-88c6-603d6fbc148d
# ╠═2a337901-6a33-4cc9-9c7d-4e9a3793f1aa
# ╠═7e604d85-9f06-469d-b910-72b50c4d8ee1
# ╠═8f46b9a3-dbad-4bc5-98d7-21cee335e1aa
# ╠═1d3a0720-4638-4f7f-b60c-b93751a5336a
# ╠═687bec85-d95a-40bf-83da-3f83edeb7e4f
# ╠═166f1b17-671a-4395-b8bd-dd17e6096f54
# ╠═956d11a3-e226-4bf7-929b-f9ccf719719f
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
