program veilvote_private_j007_v2.aleo;

record Vote:
    owner as address.private;
    choice as u8.private;

record Nullifier:
    owner as address.private;

mapping tally:
    key as u8.public;
    value as u32.public;

function cast_vote:
    input r0 as u8.private;
    cast self.caller r0 into r1 as Vote.record;
    cast self.caller into r2 as Nullifier.record;
    output r1 as Vote.record;
    output r2 as Nullifier.record;

function count_vote:
    input r0 as Vote.record;
    async count_vote r0.choice into r1;
    output r1 as veilvote_private_j007_v2.aleo/count_vote.future;

finalize count_vote:
    input r0 as u8.public;
    get tally[r0] into r1;
    add r1 1u32 into r2;
    set r2 into tally[r0];

function reveal_choice:
    input r0 as Vote.record;
    output r0.choice as u8.private;
