# Review

Code review against plan, requirements, and quality standards.

Load requesting-code-review skill for the full process.

## Review Checklist

### Plan Compliance
- [ ] Does the implementation match what was planned?
- [ ] Are all acceptance criteria met?
- [ ] Any scope creep (things added that weren't planned)?

### Code Quality
- [ ] Is the code readable without needing comments to explain it?
- [ ] Are functions doing one thing?
- [ ] Is error handling present at system boundaries?
- [ ] Are there tests for the new behavior?

### Security
- [ ] Any user input that isn't validated?
- [ ] Any secrets or credentials in the code?
- [ ] Any new endpoints missing authorization?

### Performance
- [ ] Any obvious inefficiencies (N+1 queries, blocking I/O)?

## Issue Severity
- **Critical**: Blocks shipping — security vulnerabilities, broken functionality
- **High**: Should fix before shipping — significant quality issues
- **Medium**: Fix soon — technical debt, missing tests
- **Low**: Nice to have — style, minor improvements
