import Commander

extension Int {
    func digits() -> [Int] {
        if self / 1 == 0 {
            return []
        }

        return (self / 10).digits() + [self % 10]
    }
}

let main = command { (num: Int) in
    let checksum = num.digits()
        .reverse()
        .enumerate()
        .reduce(0) { (sum, val) in
            switch val {
                case (let idx, 0...8) where idx % 2 == 0:
                    return sum + val.element * 2 % 9
                default:
                    return sum + val.element
            }
        } * 9 % 10

    print(checksum)
}

main.run()
