program veilvote_private_j007_v2.aleo {

    record Vote {
        owner: address,
        choice: u8,
    }

    record Nullifier {
        owner: address,
    }

    mapping tally: u8 => u32;

    transition cast_vote(choice: u8) -> (Vote, Nullifier) {
        let voter: address = self.caller;

        let vote: Vote = Vote {
            owner: voter,
            choice: choice,
        };

        let nullifier: Nullifier = Nullifier {
            owner: voter,
        };

        return (vote, nullifier);
    }

    async transition count_vote(vote: Vote) -> Future {
        let choice: u8 = vote.choice;

        let result = async {
            let current: u32 = tally.get(choice);
            tally.set(choice, current + 1u32);
        };

        return result;
    }

    transition reveal_choice(vote: Vote) -> u8 {
        return vote.choice;
    }
}

