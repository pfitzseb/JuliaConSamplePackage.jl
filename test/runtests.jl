using JuliaConSamplePackage
using Test

@testset "JuliaConSamplePackage.jl" begin
    @test JuliaConSamplePackage.newton(sin, cos, 1.0) ≈ 0.0
    @test JuliaConSamplePackage.newton(cos, x -> -sin(x), 1.0) ≈ pi/2
    @test JuliaConSamplePackage.newton(x -> x^2 - 2x - 1, x -> 2x - 2, 3.0)  ≈ 2.414213562373095
    @test abs(JuliaConSamplePackage.newton(x -> exp(x) - cos(x), x -> exp(x) + sin(x), 3.0) - 0.0) <= 1e-14
    @test abs(JuliaConSamplePackage.newton(x -> x^5 - x - 1, x -> 5x^4 - 1, 1.0) - 1.1673039782614187) <= 1e-14

    @testset "autodiff" begin
        @test abs(JuliaConSamplePackage.newton(sin, 0.5) - 0.0) <= 100*eps(1.0)
        @test JuliaConSamplePackage.newton(cos, 1.0) ≈ pi/2
        @test JuliaConSamplePackage.newton(x -> x^2 - 2x - 1, 3.0)  ≈ 2.414213562373095
        @test abs(JuliaConSamplePackage.newton(x -> exp(x) - cos(x), 3.0) - 0.0) <= 1e-14
        @test abs(JuliaConSamplePackage.newton(x -> cos(x) - x^3, 3.0) - 0.8654740331016144) <= 1e-14
    end
end
