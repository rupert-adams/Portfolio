import React, { Component, Fragment } from 'react';
import { connect } from 'react-redux';
import PropTypes from 'prop-types';
import { getProjects } from '../../actions/projects';

export class Projects extends Component {
    static propTypes = {
        projects: PropTypes.array.isRequired,
        getProjects: PropTypes.func.isRequired
    }

    componentDidMount() {
        this.props.getProjects();
    }

    render() {
        return (
            <Fragment>
                <h2>Projects</h2>
                <table className="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Organization</th>
                            <th>Description</th>
                        </tr>
                    </thead>
                    <tbody>
                        { this.props.projects.map(project => (
                            <tr key={project.id}>
                                <td>{project.id}</td>
                                <td>{project.name}</td>
                                <td>{project.org}</td>
                                <td>{project.description}</td>
                            </tr>
                        )) }
                    </tbody>
                </table>
            </Fragment>
        )
    }
}

const mapStateToProps = state => ({
    projects: state.projects.projects
})

export default connect(mapStateToProps, { getProjects })(Projects);