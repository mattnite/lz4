const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const liblz4 = b.addStaticLibrary(.{
        .name = "lz4",
        .target = target,
        .optimize = optimize,
        .link_libc = true,
    });
    b.installArtifact(liblz4);

    liblz4.addIncludePath("lib");
    liblz4.addCSourceFiles(&.{
        "lib/lz4.c",
        "lib/lz4hc.c",
        "lib/lz4frame.c",
        "lib/lz4file.c",
        "lib/xxhash.c",
    }, &.{});

    liblz4.installHeader("lib/lz4.h", "lz4.h");
    liblz4.installHeader("lib/lz4hc.h", "lz4hc.h");
    liblz4.installHeader("lib/lz4frame.h", "lz4frame.h");
    liblz4.installHeader("lib/lz4file.h", "lz4file.h");
}
