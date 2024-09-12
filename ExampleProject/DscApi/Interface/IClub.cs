using DscApi.Models.Entity;
using DscApi.Models.Request;
using DscApi.Models.Response;

namespace DscApi.Interface
{
    public interface IClub
    {
        public Task<List<Club>> ClubSelectAll();
        public Task<List<Club>> ClubSelectById(int id);
        public Task<bool> ClubInsert(ClubAddModRequest request);
        public Task<bool> ClubUpdate(ClubAddModRequest request);
        public Task<bool> ClubDelete(int id);

    }
}
