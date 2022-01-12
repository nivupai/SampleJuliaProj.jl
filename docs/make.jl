using SampleJuliaProj
using Documenter

DocMeta.setdocmeta!(SampleJuliaProj, :DocTestSetup, :(using SampleJuliaProj); recursive=true)

makedocs(;
    modules=[SampleJuliaProj],
    authors="Nivedita Rethnakar et al.",
    repo="https://github.com/nivupai/SampleJuliaProj.jl/blob/{commit}{path}#{line}",
    sitename="SampleJuliaProj.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://nivupai.github.io/SampleJuliaProj.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/nivupai/SampleJuliaProj.jl",
    devbranch="main",
)
